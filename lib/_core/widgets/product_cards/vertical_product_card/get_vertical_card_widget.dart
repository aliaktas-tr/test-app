import 'package:new_weedus/export.dart';

class GetVerticalCardWidget {
  static final double _fontSize = 16;
  static final double _titleFontSize = 17;
  static final double _typeFontSize = 15;
  static final double _imageHeight = 100;
  static final double _imageWidth = 150;
  static ProductCartViewModel _cardViewModel = ProductCartViewModel();

  static Column productInfoColumn(BuildContext context, Product product,
      String flOzTitle, String slash, String mlTitle) {
    return Column(
      children: [
        imageStack(context, product),
        SizedBox(height: defaultSize),
        Column(children: [
          _text(product.brand!,
              color: effectsTextColor, fontSize: _typeFontSize),
          _text(product.title!,
              color: nero,
              fontWeight: FontWeight.w600,
              fontSize: _titleFontSize)
        ]),
        SizedBox(height: defaultSize),
        AppViewWidgets.appDivider(
            height: 0,
            indent: defaultSize,
            endIndent: defaultSize,
            thickness: 0.5),
        SizedBox(height: defaultSize),
        weightWidget(product, flOzTitle, slash, mlTitle),
        SizedBox(height: defaultSize / 3),
        decimalPrice(product),
        product.thc != null || product.cbd != null
            ? SizedBox(height: defaultSize)
            : SizedBox.shrink()
      ],
    );
  }

  static Stack imageStack(BuildContext context, Product product) {
    return Stack(children: [
      Center(
          child: OnHoverWidget(
              child: AppViewWidgets.customInkWell(
               /*   onTap: () => _cardViewModel.productInfoSideSheet(context,
                      product: product),*/
                  child: Image.asset(
                      product.transparentImages != null
                          ? product.transparentImages![0]
                          : product.images![0],
                      height: _imageHeight,
                      width: _imageWidth)))),
    ]);
  }

  static SmallDecimalPriceText decimalPrice(Product product) {
    return SmallDecimalPriceText(
        product: product, color: nero, priceSize: _fontSize);
  }

  static Row weightWidget(
      Product product, String flOzTitle, String slash, String mlTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        product.size != null
            ? _text('${product.size.toString()}g',
                fontWeight: FontWeight.normal)
            : product.ml != null && product.flOz != null
                ? Row(children: [
                    product.flOz != null
                        ? _text('${product.flOz.toString()} $flOzTitle',
                            fontWeight: FontWeight.normal)
                        : SizedBox.shrink(),
                    product.ml != null ? _text(slash) : SizedBox(),
                    product.ml != null
                        ? _text('${product.ml.toString()} $mlTitle',
                            fontWeight: FontWeight.normal)
                        : SizedBox.shrink()
                  ])
                : product.pack != null
                    ? _text(product.pack!, fontWeight: FontWeight.normal)
                    : SizedBox.shrink(),
        SizedBox(width: halfDefaultSize),
        product.type != null
            ? _text(product.type!, fontWeight: FontWeight.w600)
            : SizedBox.shrink(),
      ],
    );
  }

  static Row thcAndCbd(Product product, String thcTitle, String cbdTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        product.type != null || product.thc != null || product.cbd != null
            ? Row(
                children: [
                  product.thc != null
                      ? _type('$thcTitle: ${product.thc}', boxActive: true)
                      : SizedBox.shrink(),
                  product.cbd != null
                      ? SizedBox(width: defaultSize)
                      : SizedBox.shrink(),
                  product.cbd != null
                      ? _type('$cbdTitle: ${product.cbd}', boxActive: true)
                      : SizedBox.shrink(),
                ],
              )
            : SizedBox.shrink(),
      ],
    );
  }

  static Positioned strainWidget(Product product, String indicaTitle,
      String sativaTitle, String hybridTitle, String cbdTitle) {
    return Positioned(
      top: halfDefaultSize,
      left: halfDefaultSize,
      child: product.isIndica != null ||
              product.isSativa != null ||
              product.isHybrid != null ||
              product.isCBD != null
          ? StrainTypeView(product: product, fontSize: _typeFontSize)
          : SizedBox.shrink(),
    );
  }

  static Widget _text(String title,
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return AppViewWidgets.textMontserrat(title,
        fontSize: fontSize ?? _fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? nero);
  }

  static Widget _type(String title,
      {FontWeight? fontWeight, bool? boxActive = true}) {
    return Container(
      padding: boxActive!
          ? EdgeInsets.symmetric(
              vertical: quarterDefaultSize, horizontal: halfDefaultSize)
          : null,
      decoration: boxActive
          ? BoxDecoration(
              color: effectsBoxColor,
             // borderRadius: BorderRadius.circular(quarterDefaultSize)
      )
          : null,
      child: _text(title,
          color: effectsTextColor,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontSize: _typeFontSize),
    );
  }
}
