import 'package:new_weedus/export.dart';

class EffectViewWidgets {
  static const double _titleFontSize = 16;
  static const double _descriptionFontSize = 14;
  static const double _svgHeight = 25;
  static const String _effectsTitle = 'Effects:';
  static const String _relaxedTitle = 'Relaxed';
  static const double _desiredItemWidth = 125;

  static final EdgeInsetsGeometry _effectMargin =
      EdgeInsets.only(right: halfDefaultSize, bottom: halfDefaultSize);
  static final EdgeInsetsGeometry _effectPadding = EdgeInsets.symmetric(
      horizontal: halfDefaultSize, vertical: halfDefaultSize);

  static Widget effectGrid({List<String>? list}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _text(_effectsTitle),
        SizedBox(height: halfDefaultSize),
        ResponsiveGridList(
            shrinkWrap: true,
            desiredItemWidth: _desiredItemWidth,
            children: List.generate(
                list!.length,
                (index) => _effectWidget(
                    svgFile: list[index].toLowerCase(),
                    effectTitle: list[index],
                    havePadding: list.contains(_relaxedTitle) ? true : false))),
      ],
    );
  }

  static Widget _effectWidget(
      {String? svgFile, String? effectTitle, bool? havePadding = false}) {
    return Container(
        margin: _effectMargin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(halfDefaultSize),
            color: bgColor),
        child: Padding(
            padding: _effectPadding,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/effects/$svgFile.svg',
                      height: _svgHeight),
                  SizedBox(width: quarterDefaultSize),
                  Container(
                      child: _text(effectTitle!,
                          fontSize: _descriptionFontSize,
                          textAlign: TextAlign.center,
                          color: white))
                ])));
  }

  static Widget _text(String title,
          {double? fontSize,
          FontWeight? fontWeight,
          TextAlign? textAlign,
          Color? color,
          double? height}) =>
      AppViewWidgets.textMontserrat(title,
          fontSize: fontSize ?? _titleFontSize,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? effectsTextColor,
          textAlign: textAlign,
          height: height);
}
