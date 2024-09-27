import 'package:new_weedus/export.dart';

class ProductCartViewModel {
  double _purchaseSize = 28.5;
  bool? _purchaseErrorExpand = false;
  Timer? _purchaseErrorTimer;

  void saveRouteSharedPref(bool isDispensaryView) {
    if (isDispensaryView) {
      sharedPref.saveBool('DISPENSARY_ROUTE', true);
      sharedPref.saveBool('SHOP_ROUTE', false);
    } else {
      sharedPref.saveBool('SHOP_ROUTE', true);
      sharedPref.saveBool('DISPENSARY_ROUTE', false);
    }
  }

  Future<void> _cartDialog(BuildContext context) async {
    return await ProductCartDialog.showDialog(context,
        displayTime: Duration(seconds: 6),
        maskColor: Colors.transparent,
        clickMaskDismiss: true,
        alignment: Alignment.topRight);
  }

  Future<void> addFlowerItemToCart(BuildContext context, int index,
      {CartState? cart, Product? product, bool? isDispensaryView}) async {
    cart!.addFlowerItem(product: product!, index: index);
    saveRouteSharedPref(isDispensaryView!);
    return await _cartDialog(context);
  }

  Future<void> addNewFlowerItemToCart(BuildContext context, int index,
      {CartState? cart, Product? product, bool? isDispensaryView}) async {
    cart!.addNewFlowerToCart(product: product!, index: index);
    saveRouteSharedPref(isDispensaryView!);
    return await _cartDialog(context);
  }

  Future<void> addItemToCart(BuildContext context,
      {CartState? cart, Product? product, bool? isDispensaryView}) async {
    cart!.addItem(product: product!);
    saveRouteSharedPref(isDispensaryView!);
    return await _cartDialog(context);
  }

  Future<void> addNewItemToCart(BuildContext context,
      {CartState? cart, Product? product, bool? isDispensaryView}) async {
    cart!.addToCart(product: product!);
    saveRouteSharedPref(isDispensaryView!);
    return await _cartDialog(context);
  }

  double get purchaseSize => _purchaseSize;

  bool get purchaseErrorExpand => _purchaseErrorExpand!;

  Timer get purchaseErrorTimer => _purchaseErrorTimer!;
}
