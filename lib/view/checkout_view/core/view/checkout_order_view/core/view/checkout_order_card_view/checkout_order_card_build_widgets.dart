import 'package:new_weedus/export.dart';

class CheckoutOrderCardConstants {
  CheckoutOrderCardConstants._();

  static final double _brandFontSize = 12;
  static final double _fontSize = 14;
  static final double _titleFontSize = 16;
  static final String _gram = 'g';
  static final String _flOz = 'fl oz';
  static final String _slash = ' / ';
  static final String _ml = 'ml';
  static final String _off = '% OFF';
  static final double _imageWidth = 70;
  static final double _imageHeight = 50;
  static final int _darkenValue = 20;
  static final double _opacityValue = 0.7;
  static final double _thickness = 2.2;
}

class CheckoutOrderCardBuildWidgets {
  static Widget buildWidget(
          {CartState? cart, Product? product, dynamic finalPrice}) =>
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        _imageWidget(cart!, product!),
        _halfWidthSizedBox,
        _getProductInfo(finalPrice, cart, product)
      ]);

  static Center _imageWidget(CartState cart, Product product) => Center(
      child: Image.asset(product.images![0],
          width: CheckoutOrderCardConstants._imageWidth,
          height: CheckoutOrderCardConstants._imageHeight));

  static Widget get _halfWidthSizedBox => SizedBox(width: halfDefaultSize);

  static Widget _getProductInfo(
          dynamic finalPrice, CartState cart, Product product) =>
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            _productInfoWidget(cart, product),
            _getUnits(finalPrice, product)
          ]));

  static Widget _productInfoWidget(CartState cart, Product product) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_brandColumn(product), _quantityButton(cart, product)]);

  static Widget _getUnits(dynamic finalPrice, Product product) =>
      IntrinsicWidth(
          child: Align(
              alignment: Alignment.topLeft,
              child: _sizeWidget(finalPrice, product)));

  static Widget _quantityButton(CartState cart, Product product) =>
      QuantityButtonView(cart: cart, product: product);

  static Widget _sizeWidget(dynamic finalPrice, Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _units(product),
        SizedBox(width: halfDefaultSize),
        product.type != null ? text(product.type!) : SizedBox.shrink(),
        _getSpacing(product),
        _priceWidget(finalPrice, product: product)
      ],
    );
  }

  static Row _units(Product product) => Row(
        children: [
          product.size != null
              ? text(product.size.toString() + CheckoutOrderCardConstants._gram)
              : product.ml != null && product.flOz != null
                  ? _mlFlOz(product)
                  : product.pack != null
                      ? text(product.pack!)
                      : SizedBox.shrink()
        ],
      );

  static Row _mlFlOz(Product product) => Row(children: [
        product.flOz != null
            ? text(
                '${product.flOz.toString()} ${CheckoutOrderCardConstants._flOz}')
            : SizedBox.shrink(),
        product.ml != null
            ? text(CheckoutOrderCardConstants._slash)
            : SizedBox(),
        product.ml != null
            ? text('${product.ml.toString()} ${CheckoutOrderCardConstants._ml}')
            : SizedBox.shrink()
      ]);

  static Row _getSpacing(Product product) => Row(
        children: [
          product.size != null ||
                  product.flOz != null ||
                  product.ml != null ||
                  product.pack != null
              ? SizedBox(width: halfDefaultSize)
              : SizedBox.shrink(),
          product.size != null ||
                  product.flOz != null ||
                  product.ml != null ||
                  product.pack != null
              ? AppViewWidgets.circleSeparate()
              : SizedBox.shrink(),
          product.size != null ||
                  product.flOz != null ||
                  product.ml != null ||
                  product.pack != null
              ? SizedBox(width: halfDefaultSize)
              : SizedBox.shrink()
        ],
      );

  static Widget _priceWidget(dynamic finalPrice, {Product? product}) {
    return product!.discount != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
                text(formatPrice(product.price),
                    fontWeight: FontWeight.w600,
                    color: effectsTextColor,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: CheckoutOrderCardConstants._thickness),
                SizedBox(width: defaultSize),
                product.discount != null
                    ? text(
                        '${product.discount}${CheckoutOrderCardConstants._off}',
                        fontWeight: FontWeight.w600,
                        color: Colors.red
                            .darken(CheckoutOrderCardConstants._darkenValue))
                    : SizedBox.shrink(),
                SizedBox(width: halfDefaultSize),
                text(formatPrice(finalPrice),
                    fontWeight: FontWeight.w600, color: nero)
              ])
        : text(
            formatPrice(product.price),
            fontWeight: FontWeight.w600,
            color: nero,
          );
  }

  static Widget _brandColumn(Product product) {
    return Padding(
        padding: const EdgeInsets.only(top: halfDefaultSize),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_brand(product), _product(product)]));
  }

  static Widget _brand(Product product) => text(product.brand,
      fontSize: CheckoutOrderCardConstants._brandFontSize,
      color: effectsTextColor
          .withOpacity(CheckoutOrderCardConstants._opacityValue));

  static Widget _product(Product product) => text(product.title!,
      fontWeight: FontWeight.w600,
      color: nero,
      fontSize: CheckoutOrderCardConstants._titleFontSize,
      textAlign: TextAlign.start);

  static Widget text(String? title,
      {FontWeight? fontWeight,
      double? fontSize,
      Color? color,
      TextAlign? textAlign,
      double? height,
      TextDecoration? decoration,
      double? decorationThickness}) {
    return AppViewWidgets.textMontserrat(title!,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? effectsTextColor,
        fontSize: fontSize ?? CheckoutOrderCardConstants._fontSize,
        textAlign: textAlign,
        height: height,
        decoration: decoration,
        decorationThickness: decorationThickness);
  }
}
