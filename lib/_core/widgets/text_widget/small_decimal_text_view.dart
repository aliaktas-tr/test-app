import 'package:new_weedus/export.dart';


class SmallDecimalPriceText extends StatelessWidget {
  const SmallDecimalPriceText(
      {Key? key,
        required this.product,
        this.isPriceList = false,
        this.color,
        this.priceSize,
        this.decimalSize,
        this.index, this.mainAxisAlignment})
      : super(key: key);
  final Product product;
  final bool? isPriceList;
  final Color? color;
  final double? priceSize;
  final double? decimalSize;
  final int? index;
  final MainAxisAlignment? mainAxisAlignment;
  final double _fontSize = 16.0;
  final double _decimalFontSize= 12.0;

  @override
  Widget build(BuildContext context) {
    var _productPrice;
    var _price;
    var _decimal;
    if (isPriceList!) {
      _productPrice = formatPrice(product.priceList![index!]);
      _price = _productPrice!.split('.')[0];
      _decimal = _productPrice.split('.')[1];
    } else {
      _productPrice = formatPrice(product.price);
      _price = _productPrice!.split('.')[0];
      _decimal = _productPrice.split('.')[1];
    }
    return Row(
      mainAxisAlignment:mainAxisAlignment?? MainAxisAlignment.center,
      children: [
        AppViewWidgets.textMontserrat(_price,
            color: color ?? nero,
            fontSize: priceSize ?? _fontSize,
            fontWeight: FontWeight.w600),
        AppViewWidgets.textMontserrat(
          '.',
          fontWeight: FontWeight.w600,
          color: color ??nero,
        ),
        AppViewWidgets.textMontserrat(_decimal,
            color: color ?? nero,
            fontSize: decimalSize ?? _decimalFontSize,
            fontWeight: FontWeight.w500),
      ],
    );
  }
}