import 'package:new_weedus/export.dart';

class TabWidget extends StatelessWidget {
  TabWidget(
      {super.key,
      this.title,
      this.onTap,
      this.addSinglePadding = false,
      this.fontSize,
      this.color,
      this.padding});

  final String? title;
  final VoidCallback? onTap;
  final bool? addSinglePadding;
  final double? fontSize;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry _paddingOnly =
      EdgeInsets.only(left: quarterDefaultSize, right: defaultSize * 1.5);
  final double _fontSize = 16;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding ?? _paddingOnly,
        child: AppViewWidgets.customInkWell(
            onTap: onTap, child: Text(title!, style: _textStyle)));
  }

  TextStyle get _textStyle => GoogleFonts.michroma(
      fontSize: fontSize ?? _fontSize,
      fontWeight: FontWeight.w400,
      color: color ?? white9);
}
