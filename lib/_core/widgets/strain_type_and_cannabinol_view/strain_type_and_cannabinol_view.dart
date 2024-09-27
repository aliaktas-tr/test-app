import 'package:new_weedus/export.dart';

class StrainTypeView extends StatelessWidget {
  StrainTypeView(
      {super.key,
      required this.product,
      this.fontSize,
      this.fontWeight,
      this.boxActive = true,
      this.inFilterMenu = false,
      this.fontColor,
      this.boxDecoration,
      this.boxHeight,
      this.padding});

  final Product product;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? boxActive;
  final bool? inFilterMenu;
  final Color? fontColor;
  final BoxDecoration? boxDecoration;
  final double? boxHeight;
  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry _boxPadding = EdgeInsets.symmetric(
      vertical: quarterDefaultSize, horizontal: 10.0);

  final BoxDecoration _decoration = BoxDecoration(
      color: effectsBoxColor, borderRadius: BorderRadius.circular(defaultSize));

  final String _indica = 'Indica';
  final String _sativa = 'Sativa';
  final String _hybrid = 'Hybrid';
  final String _cbd = 'CBD';
  final String _empty = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        height: boxHeight,
        padding: padding != null
            ? padding
            : boxActive!
                ? _boxPadding
                : null,
        decoration: boxDecoration != null
            ? boxDecoration
            : boxActive!
                ? _decoration
                : null,
        child: Center(child: _strainType));
  }

  Widget get _strainType => _text(product.isIndica == true
      ? _indica
      : product.isSativa == true
          ? _sativa
          : product.isHybrid == true
              ? _hybrid
              : product.isCBD == true
                  ? _cbd
                  : _empty);

  Widget _text(String title) => AppViewWidgets.textMontserrat(title,
      color: fontColor ?? effectsTextColor,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: fontSize ?? null);
}

class CannabinolView extends StatelessWidget {
  CannabinolView(
      {super.key,
      required this.product,
      this.fontSize,
      this.fontWeight,
      this.boxActive = true,
      this.inFilterMenu = false,
      this.fontColor,
      this.boxDecoration,
      this.boxHeight,
      this.padding});

  final Product product;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? boxActive;
  final bool? inFilterMenu;
  final Color? fontColor;
  final BoxDecoration? boxDecoration;
  final double? boxHeight;
  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry _boxPadding = EdgeInsets.symmetric(
      vertical: quarterDefaultSize, horizontal: halfDefaultSize);

  final BoxDecoration _decoration = BoxDecoration(color: effectsBoxColor);

  final String _thc = 'THC: ';
  final String _cbd = 'CBD: ';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        product.thc != null
            ? Container(
                height: boxHeight,
                padding: padding != null
                    ? padding
                    : boxActive!
                        ? _boxPadding
                        : null,
                decoration: boxDecoration != null
                    ? boxDecoration
                    : boxActive!
                        ? _decoration
                        : null,
                child: Center(child: _text(_thc + '${product.thc}%')))
            : _shrink,
        SizedBox(width: halfDefaultSize),
        product.cbd != null
            ? Container(
                height: boxHeight,
                padding: padding != null
                    ? padding
                    : boxActive!
                        ? _boxPadding
                        : null,
                decoration: boxDecoration != null
                    ? boxDecoration
                    : boxActive!
                        ? _decoration
                        : null,
                child: Center(child: _text(_cbd + '${product.cbd}%')))
            : _shrink,
      ],
    );
  }

  SizedBox get _shrink => const SizedBox.shrink();

  Widget _text(String title) => AppViewWidgets.textMontserrat(title,
      color: fontColor ?? effectsTextColor,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: fontSize ?? null);
}
