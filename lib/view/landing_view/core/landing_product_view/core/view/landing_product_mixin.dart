import 'package:new_weedus/export.dart';

mixin LandingProductMixin on State<LandingProductView> {
  final double _purchaseSize = 28.5;
  final ProductCartViewModel _cardViewModel = ProductCartViewModel();

  void addProduct(BuildContext context,CartState cart, {Product? product, bool? isDispensaryView}) {
    if (product!.size != null &&
        product.size! + cart.totalSize > _purchaseSize) {
      BuildPurchaseErrorDialog.dialog(cart);
    } else if (product.sizeList != null && product.sizeList!.length > 1) {
      BuildDialog.showDialog(
          child: ProductSizeSelectorDialogView(contextDue: context,
              product: product, isDispensaryView: isDispensaryView));
    } else {
      if (cart.cartItems!.containsKey(product.tag)) {
        _cardViewModel.addItemToCart(context,
            product: product, cart: cart, isDispensaryView: isDispensaryView);
      } else {
        _cardViewModel.addNewItemToCart(context,
            product: product, cart: cart, isDispensaryView: isDispensaryView);
      }
    }
  }
}
