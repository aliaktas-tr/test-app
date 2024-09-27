import 'package:new_weedus/export.dart';

class DialogProductPrice extends StatefulWidget {
  const DialogProductPrice({super.key, required this.product});

  final Product product;

  @override
  State<DialogProductPrice> createState() => _DialogProductPriceState();
}

class _DialogProductPriceState extends State<DialogProductPrice>
    with DialogProductPriceMixin {
  @override
  Widget build(BuildContext context) {
    final _cart = context.watch<CartState>();
    final _priceValueProvider = context.watch<CloseButtonCountDownState>();
    return Stack(children: [
      Column(children: [
        _buildPriceWidget,
        _buildSizedBox,
        _buildButtonRow(_cart, _priceValueProvider)
      ])
    ]);
  }

  Row get _buildPriceWidget =>
      DialogProductPriceWidgets.priceWidget(widget.product,
          priceListCurrentIndex: priceListCurrentIndex,
          listPriceOnTap: (index) => listPriceOnTap(index));

  SizedBox get _buildSizedBox => SizedBox(height: defaultSize);

  Row _buildButtonRow(
          CartState _cart, CloseButtonCountDownState _priceValueProvider) =>
      DialogProductPriceWidgets.buttonRow(
          addToCartOnTap: widget.product.sizeList != null
              ? () => priceListOnTap(
                  priceListCurrentIndex, _cart, _priceValueProvider)
              : () => priceOnTap(_cart, _priceValueProvider),
          checkoutOnTap: () {});
}
