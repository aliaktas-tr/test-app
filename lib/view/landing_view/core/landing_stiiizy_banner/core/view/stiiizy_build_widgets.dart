import 'package:new_weedus/export.dart';

class _StiiizyConstants {
  _StiiizyConstants._();

  static const String _stiiizyBannerPath = 'assets/stiiizy/stiiizy2.png';
  static final double _titleFontSize = 40;
  static final double _subTitleFontSize = 16;
  static final double _imageSize = 600;
  static final double _emptySpace = 50;
  static final double _desktopSize = 1200;
  static const _title = 'WHAT IS';
  static const _richTitle = ' STIIIZY';
  static const _subTitle =
      'STIIIZY offers a line of premium cannabis products that has set a new industry standard for portability and convenience. STIIIZY\'s proprietary pod system has garnered a cult-like following since its launch and has emerged as a leading lifestyle brand in cannabis.';
}

class StiiizyBuildWidgets {
  static Container buildWidget(BuildContext context) => Container(
      width: context.width * 0.7,
      padding: EdgeInsets.symmetric(vertical: doubleDefaultSize),
      decoration: BoxDecoration(
          color: nero,
          borderRadius: BorderRadius.circular(defaultSize)),
      child: context.width <= _StiiizyConstants._desktopSize
          ? _tabletView
          : _desktopView);

  static Column get _tabletView =>
      Column(children: [_imageWidget, _richTextTitle]);

  static Row get _desktopView => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding: const EdgeInsets.all(defaultSize),
                child: _imageWidget),
            SizedBox(width: _StiiizyConstants._emptySpace),
            Expanded(child: _richTextTitle)
          ]);

  static Image get _imageWidget =>
      Image.asset(_StiiizyConstants._stiiizyBannerPath,
          width: _StiiizyConstants._imageSize);

  static Center get _richTextTitle => Center(
      child:
          Column(children: [_titleWidget, _heightSizedBox, _subTitleWidget]));

  static RichText get _titleWidget => RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: _StiiizyConstants._title,
          style: _style(color: scaffoldBackgroundColor.darken(20)),
          children: <TextSpan>[
            TextSpan(
                text: _StiiizyConstants._richTitle,
                style: _style(fontWeight: FontWeight.bold, color: appColor),
                recognizer: TapGestureRecognizer()..onTap = () {})
          ]));

  static SizedBox get _heightSizedBox => SizedBox(height: defaultSize);

  static Padding get _subTitleWidget => Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultSize),
      child: AppViewWidgets.textMontserrat(_StiiizyConstants._subTitle,
          color: scaffoldBackgroundColor,
          fontSize: _StiiizyConstants._subTitleFontSize,
          textAlign: TextAlign.center));

  static TextStyle _style({FontWeight? fontWeight, Color? color}) =>
      GoogleFonts.aboreto(
          color: color ?? scaffoldBackgroundColor,
          fontSize: _StiiizyConstants._titleFontSize,
          fontWeight: fontWeight);
}
