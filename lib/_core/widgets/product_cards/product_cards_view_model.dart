
/*class ProductCardViewModel {
  double _sheetWidth = 700;
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

  Future<dynamic> productInfoSideSheet(BuildContext context,
      {Product? product}) async {
    return await SideSheet.right(
        width: _sheetWidth,
        context: context,
        body: SideSheetProductInfoView(product: product!));
  }

  Future<void> productCartSideSheet(BuildContext context) async {
    return await SideSheet.right(
        context: context, width: _sheetWidth, body: CartView());
  }

  Future<void> addFlowerItemToCart(BuildContext context, int index,
      {CartState? cart, Product? product, bool? isDispensaryView}) async {
    cart!.addFlowerItem(product: product, index: index);
    saveRouteSharedPref(isDispensaryView!);
    return await productCartSideSheet(context);
  }

  Future<void> addNewFlowerItemToCart(BuildContext context, int index,
      {CartState? cart, Product? product, bool? isDispensaryView}) async {
    cart!.addNewFlowerToCart(product: product, index: index);
    saveRouteSharedPref(isDispensaryView!);
    return await productCartSideSheet(context);
  }

  Future<void> addItemToCart(BuildContext context,
      {CartState? cart, Product? product, bool? isDispensaryView}) async {
    cart!.addItem(product: product);
    saveRouteSharedPref(isDispensaryView!);
    return await productCartSideSheet(context);
  }

  Future<void> addNewItemToCart(BuildContext context,
      {CartState? cart, Product? product, bool? isDispensaryView}) async {
    cart!.addToCart(product: product);
    saveRouteSharedPref(isDispensaryView!);
    return await productCartSideSheet(context);
  }

  double get purchaseSize => _purchaseSize;

  bool get purchaseErrorExpand => _purchaseErrorExpand!;

  Timer get purchaseErrorTimer => _purchaseErrorTimer!;
}*/
