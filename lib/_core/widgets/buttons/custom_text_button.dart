import 'package:new_weedus/export.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.overlayColor,
      required this.hoveredColor,
      this.buttonTitle,
      this.fontSize,
      this.buttonHeight,
      this.onTap,
      this.padding,
      this.borderRadius,
      this.buttonWidth,
      this.fontWeight,
      this.child,
      this.backgroundColor});

  final String? buttonTitle;
  final double? fontSize;
  final double? buttonHeight;
  final double? buttonWidth;
  final VoidCallback? onTap;
  final WidgetStateProperty<Color?> overlayColor;
  final WidgetStateProperty<Color?>? backgroundColor;
  final WidgetStateProperty<EdgeInsetsGeometry?>? padding;
  final Color hoveredColor;
  final BorderRadiusGeometry? borderRadius;
  final FontWeight? fontWeight;
  final Widget? child;

  final double _buttonFontSize = 16;
  final double _buttonHeight = 36;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: buttonHeight ?? _buttonHeight,
        width: buttonWidth ?? null,
        child: TextButton(
            onPressed: onTap ?? null,
            child: child ??
                AppViewWidgets.textMontserrat(buttonTitle,
                    fontSize: fontSize ?? _buttonFontSize,
                    fontWeight: fontWeight ?? FontWeight.w500),
            style: _buttonStyle(
                overlayColor: overlayColor,
                hoveredColor: hoveredColor,
                backgroundColor: backgroundColor)));
  }

  ButtonStyle _buttonStyle(
      {WidgetStateProperty<Color?>? overlayColor,
      WidgetStateProperty<Color?>? backgroundColor,
      Color? hoveredColor}) {
    return ButtonStyle(
        overlayColor: overlayColor,
        padding: padding ?? WidgetStateProperty.all(EdgeInsets.zero),
        backgroundColor:
            backgroundColor ?? WidgetStateProperty.all(effectsBoxColor),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return hoveredColor;
            }
            return effectsTextColor;
          },
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.zero)));
  }
}
