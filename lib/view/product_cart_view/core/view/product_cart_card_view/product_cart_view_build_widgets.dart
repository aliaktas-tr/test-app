import 'package:new_weedus/export.dart';

class _ProductCartViewConstants {
  _ProductCartViewConstants._();

  static const double _containerWidth = 500.0;
  static const double _borderRadius = 50.0;
  static const double _subtitleFontSize = 14;
  static const double _fontSize = 16;
  static const double _errorTextHeight = 1.4;
  static const List<BoxShadow> _boxShadow = [
    BoxShadow(
        color: nero05,
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3))
  ];

  static const String _shoppingCartTitle = 'Shopping Cart';
  static const String _subtotalTitle = 'Subtotal: ';
  static const String _checkoutTitle = 'Proceed to Checkout';

  static String _id = UniqueKey().toString();
  static const String _path = 'assets/app/shopping_cart.svg';
  static const String _checkoutRoute = '/product/checkout/';
  static const double _svgSize = 200.0;
  static const double _emptyPageItemSize = 65.0;
  static const double _emptyPageFontSize = 20.0;
  static const double _thickness = 0.3;
  static const double _colorOpacity = 0.5;
  static const int _darkenValue = 20;

}

class ProductCartViewBuildWidgets {
  static Container buildWidget(BuildContext context, {CartState? cart}) =>
      Container(
          width: _ProductCartViewConstants._containerWidth,
          padding: EdgeInsets.all(defaultSize),
          margin: EdgeInsets.all(defaultSize),
          decoration: BoxDecoration(
              color: scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(defaultSize),
              boxShadow: _ProductCartViewConstants._boxShadow),
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ProductCartViewBuildWidgets._widgets(context, cart: cart)
            ]),
          ));

  static Column _widgets(BuildContext context, {CartState? cart}) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _closeButtonAndTitle,
            AppViewWidgets.appDivider(
                thickness: _ProductCartViewConstants._thickness),
            buildCartItemsWidget(),
            AppViewWidgets.appDivider(color: Colors.black),
            cart!.cartItems.isEmpty
                ? SizedBox.shrink()
                : _totalPriceAndCheckoutButton(context, cart)
          ]);

  static Row get _closeButtonAndTitle => Row(children: [
        AppViewWidgets.customInkWell(
            onTap: () => SmartDialog.dismiss(force: true),
            child: Container(child: Icon(Icons.close, color: nero))),
        SizedBox(width: defaultSize),
        AppViewWidgets.textMontserrat(
            _ProductCartViewConstants._shoppingCartTitle,
            fontSize: _ProductCartViewConstants._subtitleFontSize,
            fontWeight: FontWeight.w400,
            color: nero)
      ]);

  static Row _totalPriceAndCheckoutButton(
          BuildContext context, CartState cart) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _getSubtotalText(cart),
        CustomTextButton(
            buttonTitle: _ProductCartViewConstants._checkoutTitle,
            padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
                EdgeInsets.symmetric(horizontal: halfDefaultSize)),
            onTap: () {
              context.go(_ProductCartViewConstants._checkoutRoute +
                  _ProductCartViewConstants._id);
            },
            overlayColor: WidgetStateProperty.all(appColor),
            borderRadius:
                BorderRadius.circular(_ProductCartViewConstants._borderRadius),
            hoveredColor: nero)
      ]);

  static Widget _getSubtotalText(CartState cart) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          AppViewWidgets.textMontserrat(
              _ProductCartViewConstants._subtotalTitle,
              fontSize: _ProductCartViewConstants._subtitleFontSize,
              color: nero),
          AppViewWidgets.textMontserrat(formatPrice(cart.totalAmount),
              fontSize: _ProductCartViewConstants._fontSize,
              color: nero,
              fontWeight: FontWeight.w600)
        ])
      ]);

  static Widget buildCartItemsWidget() => Consumer<CartState>(
      child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [_buildEmptyCartWidget()]),
      builder: (context, cart, child) {
        return cart.cartItems.length <= 0
            ? child!
            : ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: cart.cartItems.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final product = cart.cartItems.values.toList()[index];
                  return CardView(product: product, cart: cart);
                },
                separatorBuilder: (context, index) =>
                    AppViewWidgets.appDivider(height: quarterDefaultSize));
      });

  static Widget _buildEmptyCartWidget() => Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
            Stack(alignment: Alignment.center,clipBehavior: Clip.antiAlias, children: [
              SvgPicture.asset(_ProductCartViewConstants._path,
                  height: _ProductCartViewConstants._svgSize),
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: AppViewWidgets.customInkWell(
                    onTap: () => SmartDialog.dismiss(force: true),
                    child: Icon(Icons.add_circle_outline_outlined,
                        color: effectsBoxColor
                            .darken(_ProductCartViewConstants._darkenValue),
                        size: _ProductCartViewConstants._emptyPageItemSize)),
              )
            ]),
            SizedBox(height: doubleDefaultSize),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: doubleDefaultSize),
                child: AppViewWidgets.textMontserrat(
                    AppStrings.emptyCartDescription,
                    fontSize: _ProductCartViewConstants._emptyPageFontSize,
                    color: effectsTextColor
                        .withOpacity(_ProductCartViewConstants._colorOpacity),
                    height: _ProductCartViewConstants._errorTextHeight,
                    textAlign: TextAlign.center))
          ]));
}
