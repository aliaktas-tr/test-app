import 'package:new_weedus/export.dart';

class HorizontalProductCardView extends StatefulWidget {
  const HorizontalProductCardView(
      {super.key, this.product, this.isDispensaryView = false});

  final Product? product;
  final bool? isDispensaryView;

  @override
  State<HorizontalProductCardView> createState() =>
      _HorizontalProductCardViewState();
}

class _HorizontalProductCardViewState extends State<HorizontalProductCardView>
    with HorizontalProductCardViewMixin {
  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartState>(context, listen: false);
    final priceValueProvider =
        Provider.of<CloseButtonCountDownState>(context, listen: false);
    return Stack(
      children: [
        _product(context,_cart, priceValueProvider),
      ],
    );
  }

  Widget _product(BuildContext context,
          CartState _cart, CloseButtonCountDownState priceValueProvider) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getProduct(context,_cart, priceValueProvider),
          context.width > responseSize
              ? _sizeAndPriceWidget( context,widget.product!, priceValueProvider,
                  margin: EdgeInsets.only(left: halfDefaultSize), cart: _cart)
              : SizedBox.shrink()
        ],
      );

  Row _getProduct(BuildContext context,
          CartState cart, CloseButtonCountDownState priceValueProvider) =>
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _productImage,
            SizedBox(width: doubleDefaultSize),
            _productInfoColumn(context,cart, priceValueProvider)
          ]);

  HorizontalProductImageWidget get _productImage =>
      HorizontalProductImageWidget(product: widget.product!);

  Column _productInfoColumn(BuildContext context,
          CartState cart, CloseButtonCountDownState priceValueProvider) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HorizontalProductInfoWidget(product: widget.product!),
          context.width <= responseSize
              ? Column(
                  children: [
                    SizedBox(height: halfDefaultSize),
                    _sizeAndPriceWidget(context,widget.product!, priceValueProvider,
                        cart: cart,
                        margin: EdgeInsets.only(right: halfDefaultSize)),
                  ],
                )
              : SizedBox.shrink()
        ],
      );

  Widget _sizeAndPriceWidget(BuildContext context,
          Product product, CloseButtonCountDownState? priceValueProvider,
          {EdgeInsetsGeometry? margin, CartState? cart}) =>
      product.sizeList != null
          ? _listPrice(context,cart, priceValueProvider!)
          : _price(context,cart, margin, priceValueProvider!);

  Row _listPrice(BuildContext context,
          CartState? cart, CloseButtonCountDownState priceValueProvider) =>
      Row(
          children: List.generate(widget.product!.sizeList!.length, (index) {
        return Container(
            margin: context.width > responseSize
                ? EdgeInsets.only(left: halfDefaultSize)
                : EdgeInsets.only(right: halfDefaultSize),
            child: PriceHover(
                onTap: () => priceListOnTap(context,index, cart!, priceValueProvider),
                product: widget.product!,
                index: index,
                priceSize: priceSize,
                addBorder: true));
      }));

  PriceHover _price(BuildContext context,CartState? cart, EdgeInsetsGeometry? margin,
          CloseButtonCountDownState priceValueProvider) =>
      PriceHover(
          onTap: () => priceOnTap(context,cart!, priceValueProvider),
          product: widget.product!,
          margin: margin,
          priceSize: priceSize,
          addBorder: true);
}
