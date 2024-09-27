import 'package:new_weedus/export.dart';

class _ProductSizeSelectorDialogConstants {
  _ProductSizeSelectorDialogConstants._();

  static final double _purchaseSize = 28.5;
  static final double _dialogSize = 450.0;
  static final String _weightTitle = 'Select Weight';
  static final double _titleFontSize = 16.0;
  static final double _sizeBoxHeight = 50.0;
  static final double _imageHeight = 100.0;
  static final double _typeFontSize = 14.0;
  static final double _nonValue = 0.0;
}

class ProductSizeSelectorDialogBuildWidgets {
  static Container buildWidget(BuildContext context,
          {CartState? cart,
          Product? product,
          ProductCartViewModel? cardViewModel,
          bool? isDispensaryView}) =>
      Container(
          constraints: BoxConstraints(
              minWidth: _ProductSizeSelectorDialogConstants._dialogSize),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(mainAxisSize: MainAxisSize.min, children: [
                _dialogTitleAndCloseWidget(context),
                SizedBox(height: halfDefaultSize),
                AppViewWidgets.appDivider(
                    height: _ProductSizeSelectorDialogConstants._nonValue),
                SizedBox(height: halfDefaultSize),
                _productInfoRowWithImage(
                    context, cart!, product!, cardViewModel!, isDispensaryView!)
              ])
            ],
          ));

  static Container _dialogTitleAndCloseWidget(BuildContext context) =>
      Container(
          constraints: BoxConstraints(
              minWidth: _ProductSizeSelectorDialogConstants._dialogSize),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppViewWidgets.textMontserrat(
                  _ProductSizeSelectorDialogConstants._weightTitle,
                  fontWeight: FontWeight.w600,
                  fontSize: _ProductSizeSelectorDialogConstants._titleFontSize),
              AppViewWidgets.customInkWell(
                  onTap: () => SmartDialog.dismiss(),
                  child: Icon(Icons.close_rounded))
            ],
          ));

  static Row _productInfoRowWithImage(
          BuildContext context,
          CartState cart,
          Product product,
          ProductCartViewModel _cardViewModel,
          bool isDispensaryView) =>
      Row(children: [
        AppViewWidgets.customInkWell(
            onTap: () async => _showProductInfoDialog(product),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _productImage(product),
                  _quarterHeightEmptySpace,
                  _productType(product)
                ])),
        SizedBox(width: halfDefaultSize),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _productInfoWidget(product),
          SizedBox(height: defaultSize),
          _availableSizeList(
              context, cart, product, _cardViewModel, isDispensaryView)
        ])
      ]);

  static Future<void> _showProductInfoDialog(Product product) async {
    SmartDialog.show(
        alignment: Alignment.center,
        builder: (context) {
          return ProductInfoDialogView(product: product);
        });
  }

  static SizedBox _productImage(Product product) => SizedBox(
      height: _ProductSizeSelectorDialogConstants._imageHeight,
      child: Image.asset(product.images![0]));

  static SizedBox get _quarterHeightEmptySpace =>
      SizedBox(height: quarterDefaultSize);

  static Padding _productType(Product product) => Padding(
      padding: const EdgeInsets.symmetric(vertical: quarterDefaultSize),
      child: product.type != null
          ? AppViewWidgets.textMontserrat(product.type!,
              fontSize: _ProductSizeSelectorDialogConstants._typeFontSize)
          : SizedBox.shrink());

  static Padding _productInfoWidget(Product product) => Padding(
      padding: const EdgeInsets.only(left: defaultSize),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AppViewWidgets.textMontserrat(product.brand!,
            fontSize: _ProductSizeSelectorDialogConstants._titleFontSize,
            color: effectsTextColor,
            fontWeight: FontWeight.w600),
        AppViewWidgets.textMontserrat(product.title!,
            fontSize: _ProductSizeSelectorDialogConstants._titleFontSize,
            color: nero,
            fontWeight: FontWeight.w600)
      ]));

  static SizedBox _availableSizeList(
          BuildContext context,
          CartState cart,
          Product product,
          ProductCartViewModel _cardViewModel,
          bool isDispensaryView) =>
      SizedBox(
        height: _ProductSizeSelectorDialogConstants._sizeBoxHeight,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(product.sizeList!.length, (index) {
              return Container(
                  margin: EdgeInsets.only(right: halfDefaultSize),
                  child: PriceHover(
                      onTap: product.sizeList![index] + cart.totalSize >
                              _ProductSizeSelectorDialogConstants._purchaseSize
                          ? () => BuildPurchaseErrorDialog.dialog(cart)
                          : cart.cartItems!.containsKey(product.tagList![index])
                              ? () async => await _addItemToCart(context,cart, index,
                                  product, _cardViewModel, isDispensaryView)
                              : () async => await _addNewItemToCart(context,cart, index,
                                  product, _cardViewModel, isDispensaryView),
                      product: product,
                      index: index,
                      priceSize:
                          _ProductSizeSelectorDialogConstants._titleFontSize,
                      addBorder: true,
                      currentColor: effectsBoxColor));
            })),
      );

  static Future<void> _addItemToCart(BuildContext context,CartState cart, int index, Product product,
      ProductCartViewModel _cardViewModel, bool isDispensaryView) async {
    SmartDialog.dismiss();
    _cardViewModel.addFlowerItemToCart(context,index,
        cart: cart, product: product, isDispensaryView: isDispensaryView);
  }

  static Future<void> _addNewItemToCart(BuildContext context,
      CartState cart,
      int index,
      Product product,
      ProductCartViewModel _cardViewModel,
      bool isDispensaryView) async {
    SmartDialog.dismiss();
    _cardViewModel.addNewFlowerItemToCart(context,index,
        cart: cart, product: product, isDispensaryView: isDispensaryView);
  }
}
