import 'package:new_weedus/export.dart';

mixin HorizontalProductCardViewMixin on State<HorizontalProductCardView> {
  final ProductCartViewModel _cartViewModel = ProductCartViewModel();
  final double _purchaseSize = 28.5;
  final double _responseSize = 1080;
  final double _priceSize = 14;

/*


  void priceOnTap(CartState? cart) {
    if (widget.product!.size != null &&
        widget.product!.size! + cart!.totalSize > _purchaseSize) {
      setState(() {
        _purchaseErrorExpand = true;
      });
      if (_purchaseErrorExpand!) {
        _purchaseErrorTimer = Timer(Duration(seconds: 5), () {
          if (mounted) {
            setState(() {
              _purchaseErrorExpand = false;
            });
          }
        });
      }
    } else {
      if (cart!.cartItems.containsKey(widget.product!.tag)) {
        _cartViewModel.addItemToCart(context,
            cart: cart,
            product: widget.product!,
            isDispensaryView: widget.isDispensaryView);
      } else {
        _cartViewModel.addNewItemToCart(context,
            cart: cart,
            product: widget.product!,
            isDispensaryView: widget.isDispensaryView);
      }
    }
  }*/

  void priceListOnTap(BuildContext context,int index, CartState cart,
      CloseButtonCountDownState _priceValueProvider) {
    if (widget.product!.sizeList != null &&
        widget.product!.sizeList![index] + cart.totalSize > _purchaseSize) {
      BuildPurchaseErrorDialog.dialog(cart);
    } else {
      if (cart.cartItems!.containsKey(widget.product!.tagList![index])) {
        _cartViewModel.addFlowerItemToCart(context,index,
            cart: cart,
            product: widget.product,
            isDispensaryView: widget.isDispensaryView);
      } else {
        _cartViewModel.addNewFlowerItemToCart(context,index,
            cart: cart,
            product: widget.product,
            isDispensaryView: widget.isDispensaryView);
      }
      _priceValueProvider.startTimer();
    }
  }

  void priceOnTap(BuildContext context,
      CartState cart, CloseButtonCountDownState _priceValueProvider) {
    if (widget.product!.size != null &&
        widget.product!.size! + cart.totalSize > _purchaseSize) {
      BuildPurchaseErrorDialog.dialog(cart);
    } else {
      if (cart.cartItems!.containsKey(widget.product!.tag)) {
        _cartViewModel.addItemToCart(context,
            cart: cart,
            product: widget.product!,
            isDispensaryView: widget.isDispensaryView);
      } else {
        _cartViewModel.addNewItemToCart(context,
            cart: cart,
            product: widget.product!,
            isDispensaryView: widget.isDispensaryView);
      }
      _priceValueProvider.startTimer();
    }
  }

  ProductCartViewModel get cartViewModel => _cartViewModel;

  double get purchaseSize => _purchaseSize;

  double get responseSize => _responseSize;

  double get priceSize => _priceSize;
}
