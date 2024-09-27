import 'package:new_weedus/export.dart';

class _ProductBuildConstants {
  _ProductBuildConstants._();

  static final double _subFontSize = 12;
  static final double _fontSize = 14;
  static final double _titleFontSize = 18;
  static final String _flOz = 'fl oz';
  static final String _ml = 'ml';
  static final String _slant = ' / ';
  static final String _verticalDividing = '|';
  static final double _containerWidth = 700.0;
  static final double _imageWidth = 90.0;
  static final double _imageHeight = 80.0;
  static final double _opacity = 0.7;
}

class ProductBuildWidgets {
  static Container buildWidgets(Product product, CartState cart) => Container(
      width: _ProductBuildConstants._containerWidth,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _imageWidget(product),
        SizedBox(width: halfDefaultSize),
        Expanded(child: _productInfoWidget(product, cart))
      ]));

  static Widget _imageWidget(Product product) => Container(
      padding: EdgeInsets.only(top: halfDefaultSize),
      child: Image.asset(product.images![0],
          width: _ProductBuildConstants._imageWidth,
          height: _ProductBuildConstants._imageHeight));

  static Widget _productInfoWidget(Product product, CartState cart) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProductInfoWidgets(product),
            Padding(
              padding: const EdgeInsets.only(top: halfDefaultSize),
              child: QuantityButtonView(product: product, cart: cart),
            )
          ]);

  static Padding _buildProductInfoWidgets(Product product) => Padding(
      padding: const EdgeInsets.only(top: halfDefaultSize),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_brand(product), _title(product), _sizeWidget(product)]));

  static Widget _brand(Product product) => _text(product.brand,
      fontSize: _ProductBuildConstants._subFontSize,
      color: effectsTextColor.withOpacity(_ProductBuildConstants._opacity));

  static Widget _title(Product product) => _text(product.title!,
      fontWeight: FontWeight.w700,
      color: nero,
      fontSize: _ProductBuildConstants._titleFontSize,
      textAlign: TextAlign.start);

  static Row _sizeWidget(Product product) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          product.size != null
              ? _text('${product.size.toString()}g')
              : product.ml != null && product.flOz != null
                  ? _flOzAndMlWidget(product)
                  : product.pack != null
                      ? _text(product.pack!)
                      : _shrink,
          _halfWidthSizedBox,
          product.type != null ? _text(product.type!) : _shrink,
          _returnHalfWidthSizedBox(product),
          _verticalDivider(product),
          _returnHalfWidthSizedBox(product),
          _text(formatPrice(product.price)),
        ],
      );

  static Row _flOzAndMlWidget(Product product) => Row(children: [
        product.flOz != null
            ? _text(
                '${product.flOz.toString()} ${_ProductBuildConstants._flOz}')
            : _shrink,
        product.ml != null ? _text(_ProductBuildConstants._slant) : SizedBox(),
        product.ml != null
            ? _text('${product.ml.toString()} ${_ProductBuildConstants._ml}')
            : _shrink
      ]);

  static Widget _verticalDivider(Product product) => product.size != null ||
          product.flOz != null ||
          product.ml != null ||
          product.pack != null
      ? _text(_ProductBuildConstants._verticalDividing)
      : _shrink;

  static Widget _returnHalfWidthSizedBox(Product product) =>
      product.size != null ||
              product.flOz != null ||
              product.ml != null ||
              product.pack != null
          ? _halfWidthSizedBox
          : _shrink;

  static SizedBox get _shrink => SizedBox.shrink();

  static SizedBox get _halfWidthSizedBox => SizedBox(width: halfDefaultSize);

  static Widget _text(String? title,
      {FontWeight? fontWeight,
      double? fontSize,
      Color? color,
      TextAlign? textAlign}) {
    return AppViewWidgets.textMontserrat(title!,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? effectsTextColor,
        fontSize: fontSize ?? _ProductBuildConstants._fontSize,
        textAlign: textAlign);
  }
}
