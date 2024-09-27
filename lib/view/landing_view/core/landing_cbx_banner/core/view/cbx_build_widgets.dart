import 'package:new_weedus/export.dart';

class _CbxConstants {
  _CbxConstants._();

  static const String _cbxBannerPath = 'assets/banner/cbx.png';
  static final double _titleFontSize = 40;
  static final double _subTitleFontSize = 16;
  static final double _imageSize = 300;
  static final double _emptySpace = 50;
  static final double _desktopSize = 1200;
  static const _title = '20 years in the game - ';
  static const _richTitle = 'Cannabiotix';
  static const _subTitle =
      'Cannabiotix (often stylized CBX) is a boutique cannabis company founded in Southern California in 2014 by expert cultivators Neema and JB. Today, the company is owned and operated by Samari and childhood best friend Eran Haroni. Neem the dream and Bones grew up in SoCal together, born and raised on the beaches of Santa Monica with shared dreams of one day having a weed company with one specific goal in mind: to be able to provide their friends and family with the craziest weed they have ever seen or smoked.';
}

class CbxBuildWidgets {
  static Container buildWidget(BuildContext context) => Container(
      width: context.width * 0.7,
      padding: EdgeInsets.symmetric(vertical: doubleDefaultSize),
      decoration: BoxDecoration(
          color: scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(defaultSize)),
      child: context.width <= _CbxConstants._desktopSize
          ? _tabletView
          : _desktopView);

  static Column get _tabletView =>
      Column(children: [_imageWidget, _richTextTitle]);

  static Row get _desktopView => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: _richTextTitle),
            SizedBox(width: _CbxConstants._emptySpace),
            Padding(
                padding: const EdgeInsets.all(defaultSize), child: _imageWidget)
          ]);

  static Image get _imageWidget => Image.asset(_CbxConstants._cbxBannerPath,
      height: _CbxConstants._imageSize);

  static Center get _richTextTitle => Center(
      child:
          Column(children: [_titleWidget, _heightSizedBox, _subTitleWidget]));

  static RichText get _titleWidget => RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: _CbxConstants._title,
          style: _style(),
          children: <TextSpan>[
            TextSpan(
                text: _CbxConstants._richTitle,
                style: _style(fontWeight: FontWeight.bold, color: appColor),
                recognizer: TapGestureRecognizer()..onTap = () {})
          ]));

  static SizedBox get _heightSizedBox => SizedBox(height: defaultSize);

  static Padding get _subTitleWidget => Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultSize),
      child: AppViewWidgets.textMontserrat(_CbxConstants._subTitle,
          color: nero,
          fontSize: _CbxConstants._subTitleFontSize,
          textAlign: TextAlign.center));

  static TextStyle _style({FontWeight? fontWeight, Color? color}) =>
      GoogleFonts.aboreto(
          color: color ?? nero,
          fontSize: _CbxConstants._titleFontSize,
          fontWeight: fontWeight);
}
