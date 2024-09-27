import 'package:new_weedus/export.dart';

class CheckoutOrderCardView extends StatelessWidget {
  const CheckoutOrderCardView(
      {super.key, this.product, this.onTap, this.expand, required this.cart});

  final Product? product;
  final VoidCallback? onTap;
  final bool? expand;
  final CartState cart;

/*  final double _imageWidth = 70;
  final double _imageHeight = 50;*/

  @override
  Widget build(BuildContext context) {
    var _finalPrice;
    if (product!.discount != null) {
      var _discount = product!.price! * product!.discount! / 100;
      _finalPrice = product!.price! - _discount;
    }
    return CheckoutOrderCardBuildWidgets.buildWidget(
        cart: cart, product: product, finalPrice: _finalPrice);
  }

/* Center get _imageWidget => Center(
      child: Image.asset(product!.images![0],
          width: _imageWidth, height: _imageHeight));

  Widget get _halfWidthSizedBox => SizedBox(width: halfDefaultSize);

  Widget _getProductInfo(dynamic finalPrice) => Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [_productInfoWidget, _getUnits(finalPrice)]));

  Widget get _productInfoWidget => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CheckoutOrderCardBuildWidgets.brandColumn(product!),
            _quantityButton
          ]);

  Widget _getUnits(dynamic finalPrice) => IntrinsicWidth(
      child: Align(
          alignment: Alignment.topLeft,
          child:
              CheckoutOrderCardBuildWidgets.sizeWidget(finalPrice, product!)));

  Widget get _quantityButton =>
      QuantityButtonView(cart: cart, product: product!);*/
}
