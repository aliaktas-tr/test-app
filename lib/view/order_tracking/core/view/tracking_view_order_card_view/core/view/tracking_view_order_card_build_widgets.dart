import 'package:new_weedus/export.dart';

class _TrackingOrderViewCardConstants {
  _TrackingOrderViewCardConstants._();

  static final double _brandFontSize = 12;
  static final double _fontSize = 14;
  static final double _titleFontSize = 16;
  static final String _gram = 'g';
  static final String _flOz = 'fl oz';
  static final String _slash = ' / ';
  static final String _ml = 'ml';
  static final String _qty = 'Qty: ';
  static final double _imageWidth = 70;
  static final double _imageHeight = 50;
}

class TrackingViewOrderCardBuildWidgets {
  static Widget buildWidgets(Product product, dynamic finalPrice) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _imageWidget(product),
            _sizedBox,
            _getProduct(finalPrice, product)
          ]);

  static Widget _imageWidget(Product product) => Center(
      child: Image.asset(product.images![0],
          width: _TrackingOrderViewCardConstants._imageWidth,
          height: _TrackingOrderViewCardConstants._imageHeight));

  static SizedBox get _sizedBox => SizedBox(width: halfDefaultSize);

  static Widget _getProduct(dynamic finalPrice, Product product) =>
      Expanded(child: _productInfoBuildWidget(finalPrice, product));

  static SizedBox get _shrink => SizedBox.shrink();

  static Widget _productInfoBuildWidget(dynamic finalPrice, Product product) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_brandColumn(product), _priceWidget(finalPrice, product)],
    );
  }

  static Widget _brandColumn(Product product) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _text(product.brand,
          fontSize: _TrackingOrderViewCardConstants._brandFontSize,
          color: effectsTextColor.withOpacity(0.7)),
      _text(product.title!,
          fontWeight: FontWeight.w600,
          color: nero,
          fontSize: _TrackingOrderViewCardConstants._titleFontSize,
          textAlign: TextAlign.start),
      _sizeWidget(product)
    ]);
  }

  static Widget _sizeWidget(Product product) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          product.size != null
              ? _text(
                  '${product.size.toString()}${_TrackingOrderViewCardConstants._gram}')
              : product.ml != null && product.flOz != null
                  ? _mlFlOz(product)
                  : product.pack != null
                      ? _text(product.pack!)
                      : _shrink,
          SizedBox(width: halfDefaultSize),
          product.type != null ? _text(product.type!) : _shrink
        ]);
  }

  static Row _mlFlOz(Product product) => Row(children: [
        product.flOz != null
            ? _text(
                '${product.flOz.toString()} ${_TrackingOrderViewCardConstants._flOz}')
            : _shrink,
        product.ml != null
            ? _text(_TrackingOrderViewCardConstants._slash)
            : _shrink,
        product.ml != null
            ? _text(
                '${product.ml.toString()} ${_TrackingOrderViewCardConstants._ml}')
            : _shrink
      ]);

  static Widget _priceWidget(dynamic finalPrice, Product product) {
    return product.discount != null
        ? _discountPrice(finalPrice, product)
        : _price(product);
  }

  static Column _discountPrice(dynamic finalPrice, Product product) => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            _text(formatPrice(finalPrice),
                fontWeight: FontWeight.w600, color: nero),
            _text('${_TrackingOrderViewCardConstants._qty}${product.quantity}',
                color: nero)
          ]);

  static Column _price(Product product) => Column(children: [
        _text(formatPrice(product.price),
            fontWeight: FontWeight.w600, color: nero),
        _text('${_TrackingOrderViewCardConstants._qty}${product.quantity}',
            color: nero)
      ]);

  static Widget _text(String? title,
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
        fontSize: fontSize ?? _TrackingOrderViewCardConstants._fontSize,
        textAlign: textAlign,
        height: height,
        decoration: decoration,
        decorationThickness: decorationThickness);
  }
}
