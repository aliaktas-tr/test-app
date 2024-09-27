import 'package:new_weedus/export.dart';

class DialogProductPriceWidgets {
  static final double _fontSize = 14;
  static final double _subFontSize = 12.5;
  static final double _textHeight = 0.95;
  static final double _maxOpacityValue = 0.65;
  static final double _topPaddingValue = 4.0;
  static final String _grams = 'g';
  static final EdgeInsetsGeometry _containerMargin =
      EdgeInsets.only(right: halfDefaultSize);
  static final BorderRadiusGeometry _borderRadius =
      BorderRadius.circular(halfDefaultSize);
  static final EdgeInsetsGeometry _padding = EdgeInsets.symmetric(
      vertical: defaultSize / 3, horizontal: defaultSize / 1.5);
  static final EdgeInsetsGeometry _decimalPadding =
      EdgeInsets.only(top: _topPaddingValue);
  static const double _buttonHeight = 40;
  static final String _addToCartTitle = 'Add to cart';
  static final String _checkoutTitle = 'Checkout';

  static BoxDecoration _priceListBoxDecoration(
          Product product, int? index, int currentIndex) =>
      BoxDecoration(
          borderRadius: _borderRadius,
          border: Border.all(
              color: product.priceList!.length < 2
                  ? nero
                  : index == currentIndex
                      ? nero
                      : Colors.grey.shade300,
              width: _maxOpacityValue));

  static BoxDecoration get _priceBoxDecoration => BoxDecoration(
      borderRadius: _borderRadius,
      border: Border.all(color: nero, width: _maxOpacityValue));

  static Row buttonRow(
          {VoidCallback? addToCartOnTap, VoidCallback? checkoutOnTap}) =>
      Row(children: [
        _textButton(_addToCartTitle, false, onTap: addToCartOnTap),
        SizedBox(width: defaultSize),
        _textButton(_checkoutTitle, true, onTap: checkoutOnTap),
      ]);

  static Row priceWidget(Product product,
          {Function(int)? listPriceOnTap, int? priceListCurrentIndex}) =>
      Row(
          children: product.sizeList != null
              ? List.generate(
                  product.sizeList!.length,
                  (index) => _productPriceBox(product,
                      index: index,
                      isPriceList: true,
                      priceListCurrentIndex: priceListCurrentIndex,
                      onTap: () => listPriceOnTap!(index)))
              : [_productPriceBox(product)]);

  static SizedBox get _shrink => SizedBox.shrink();

  static Widget _productPriceBox(Product product,
          {int? index,
          bool? isPriceList = false,
          VoidCallback? onTap,
          int? priceListCurrentIndex}) =>
      AppViewWidgets.customInkWell(
          onTap: onTap,
          child: Container(
              decoration: isPriceList!
                  ? _priceListBoxDecoration(
                      product, index, priceListCurrentIndex!)
                  : _priceBoxDecoration,
              padding: _padding,
              margin: isPriceList ? _containerMargin : EdgeInsets.zero,
              child: Column(children: [
                isPriceList
                    ? Container(
                        child: product.sizeList != null
                            ? _text(
                                product.sizeList![index!].toString() + _grams,
                                fontSize: _subFontSize,
                                color: nero,
                                fontWeight: FontWeight.w600)
                            : product.pack != null
                                ? _text(product.pack!)
                                : _shrink)
                    : Container(
                        child: product.size != null
                            ? _text(product.size.toString() + _grams,
                                fontSize: _subFontSize)
                            : product.pack != null
                                ? _text(product.pack!)
                                : _shrink),
                _decimalText(product, index: index, isPriceList: isPriceList)
              ])));

  static Widget _decimalText(Product product,
          {int? index, bool? isPriceList = false}) =>
      Padding(
          padding: _decimalPadding,
          child: SmallDecimalPriceText(
              product: product, isPriceList: isPriceList, index: index));

  static Widget _textButton(String _buttonTitle, bool isCheckoutButton,
          {VoidCallback? onTap}) =>
      CustomTextButton(
          buttonHeight: _buttonHeight,
          buttonTitle: _buttonTitle,
          borderRadius: BorderRadius.circular(doubleDefaultSize),
          onTap: onTap,
          padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
              EdgeInsets.symmetric(horizontal: halfDefaultSize)),
          overlayColor: isCheckoutButton
              ? WidgetStateProperty.all(appColor)
              : WidgetStateProperty.all(bgColor),
          hoveredColor: isCheckoutButton ? nero : white);

  static Widget _text(String text,
          {double? fontSize, FontWeight? fontWeight, Color? color}) =>
      AppViewWidgets.textMontserrat(text,
          fontSize: fontSize ?? _fontSize,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? effectsTextColor,
          height: _textHeight);
}
