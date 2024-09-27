
///
/*


class ProductSizeSelectorDialogView extends StatefulWidget {
  const ProductSizeSelectorDialogView(
      {Key? key, this.product, this.isDispensaryView})
      : super(key: key);
  final Product? product;
  final bool? isDispensaryView;

  @override
  State<ProductSizeSelectorDialogView> createState() =>
      _ProductSizeSelectorDialogViewState();
}

class _ProductSizeSelectorDialogViewState
    extends State<ProductSizeSelectorDialogView> {
  final ProductCardViewModel _cardViewModel = ProductCardViewModel();
  bool? _purchaseErrorExpand = false;
  Timer? _purchaseErrorTimer;
  final double _purchaseSize = 28.5;
  final double _dialogSize = 450;
  final String _weightTitle = 'Select Weight';
  final double _fontSize = 14;
  final double _titleFontSize = 16;
  final double _errorContainerHeight = 100;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartState>();
    return Dialog(
        /*shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(quarterDefaultSize)),*/
        child: SingleChildScrollView(child: _buildDialogBox(context, cart)));
  }

  Container _buildDialogBox(BuildContext context, CartState cart) {
    return Container(
        width: _dialogSize,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(defaultSize),
              child: Column(
                children: [
                  _dialogTitleAndCloseWidget(context),
                  SizedBox(height: halfDefaultSize),
                  AppViewWidgets.appDivider(height: 0),
                  SizedBox(height: halfDefaultSize),
                  _productInfoRowWithImage(context, cart),
                ],
              ),
            ),
        /*    PurchaseLimitErrorWidget(
                cart: cart,
                height: _errorContainerHeight,
                purchaseErrorExpand: _purchaseErrorExpand,
                padding: EdgeInsets.zero,
                errorFontSize: _fontSize,
                errorCloseTap: () => _errorCloseTap()),*/
          ],
        ));
  }

  Row _dialogTitleAndCloseWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppViewWidgets.textMontserrat(_weightTitle),
        AppViewWidgets.customInkWell(
            onTap: () => context.pop(), child: Icon(Icons.close_rounded))
      ],
    );
  }

  Row _productInfoRowWithImage(BuildContext context, CartState cart) {
    return Row(
      children: [
        HorizontalProductImageWidget(
            product: widget.product!, cardViewModel: _cardViewModel),
        SizedBox(width: halfDefaultSize),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _productInfoWidget(),
          SizedBox(height: defaultSize),
          _availableSizeList(context, cart: cart)
        ])
      ],
    );
  }

  Padding _productInfoWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: defaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppViewWidgets.textMontserrat(widget.product!.brand!,
              fontSize: _fontSize,
              color: effectsTextColor,
              fontWeight: FontWeight.normal),
          AppViewWidgets.textMontserrat(widget.product!.title!,
              fontSize: _titleFontSize, color: nero),
        ],
      ),
    );
  }

  Widget _availableSizeList(BuildContext context, {CartState? cart}) {
    return SizedBox(
      height: 50,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.product!.sizeList!.length, (index) {
            return Container(
                margin: EdgeInsets.only(right: halfDefaultSize),
                child: PriceHover(
                    onTap: widget.product!.sizeList![index] + cart!.totalSize >
                            _purchaseSize
                        ? () {
                            setState(() {
                              _purchaseErrorExpand = true;
                            });
                            if (_purchaseErrorExpand!) {
                              _purchaseErrorTimer =
                                  Timer(Duration(seconds: 5), () {
                                if (mounted) {
                                  setState(() {
                                    _purchaseErrorExpand = false;
                                  });
                                }
                              });
                            }
                            return;
                          }
                        : cart.cartItems
                                .containsKey(widget.product!.tagList![index])
                            ? () => _addItemToCart(cart, index)
                            : () => _addNewItemToCart(cart, index),
                    product: widget.product,
                    index: index,
                    priceSize: _fontSize,
                    addBorder: true,
                    currentColor: effectsBoxColor));
          })),
    );
  }

  void _errorCloseTap() {
    setState(() {
      _purchaseErrorExpand = false;
      _purchaseErrorTimer!.cancel();
    });
  }

  void _addItemToCart(CartState cart, int index) {
    cart.addFlowerItem(product: widget.product, index: index);
    _cardViewModel.saveRouteSharedPref(widget.isDispensaryView!);
    context.pop();
    _cardViewModel.productCartSideSheet(context);
  }

  void _addNewItemToCart(CartState cart, int index) {
    cart.addNewFlowerToCart(product: widget.product, index: index);
    _cardViewModel.saveRouteSharedPref(widget.isDispensaryView!);
    context.pop();
    _cardViewModel.productCartSideSheet(context);
  }
}
*/
///