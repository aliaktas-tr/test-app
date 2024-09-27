import 'package:new_weedus/export.dart';
import 'package:badges/badges.dart' as badges;

class _CustomAppBarWidgets {
  static final double _leadingWidth = 0;
  static final double _responseSize = 1010;
  static final double _fontSize = 16;
  static final double _budgeFontSize = 12;
  static final double _budgeTextHeight = 0.0;
  static final String _loginTitle = 'Login';
  static final badges.BadgePosition _position =
      badges.BadgePosition.topEnd(top: -15, end: 0);

  static Widget get _shrink => SizedBox.shrink();

  static List<Widget> _actionWidgets(BuildContext context, CartState cartState,
          {VoidCallback? cartOnTap,
          bool? isTrackingPage,
          bool? isCartIconAvailable}) =>
      [
        context.width <= _responseSize
            ? _shrink
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: defaultSize, right: defaultSize),
                        child: isCartIconAvailable!
                            ? Row(children: [
                                _shoppingCartIcon(cartState,
                                    cartOnTap: cartOnTap),
                                isTrackingPage!
                                    ? !cartState.hasPayment
                                        ? _shrink
                                        : OrderTrackingIconWidget(cartState)
                                    : _shrink,
                                SizedBox(width: defaultSize),
                                AppbarUserLoginView(context2: context)
                              ])
                            : AppbarUserLoginView(context2: context)),
                  ])
      ];

  static Widget _shoppingCartIcon(CartState cart, {VoidCallback? cartOnTap}) =>
      AppViewWidgets.customInkWell(
          onTap: cartOnTap,
          child: Row(children: [
            SizedBox(width: defaultSize),
            _shoppingCartBadge(cart)
          ]));

  static Widget _shoppingCartBadge(CartState cart) {
    return badges.Badge(
        position: _position,
        badgeAnimation: badges.BadgeAnimation.size(),
        showBadge: cart.cartItems!.isEmpty ? false : true,
        badgeStyle: badges.BadgeStyle(badgeColor: appColor),
        badgeContent: cart.cartItems!.isEmpty
            ? _shrink
            : AppViewWidgets.textMontserrat(cart.cartItems!.length.toString(),
                textAlign: TextAlign.center,
                fontSize: _budgeFontSize,
                height: _budgeTextHeight,
                fontWeight: FontWeight.w500),
        child: Icon(Zocial.cart,
            color: cart.itemCount < 1 ? Colors.grey.shade600 : appColor));
  }

  static Row _appBarTitleRow(
          BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
          {VoidCallback? onAppNameRouteTap}) =>
      Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppViewWidgets.customInkWell(
                onTap: onAppNameRouteTap,
                child: SliverAppBarWidgets.logoAndAppName),
            _doubleWidthSizedBox,
            Padding(
                padding: const EdgeInsets.only(bottom: quarterDefaultSize),
                child: SliverAppBarWidgets.customTabBar(context, scaffoldKey))
          ]);

  static SizedBox get _doubleWidthSizedBox => SizedBox(width: defaultSize);

  static TextStyle get _textStyle => GoogleFonts.michroma(
      fontSize: _fontSize, fontWeight: FontWeight.w400, color: appColor);
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(
      {Key? key,
      this.height = kToolbarHeight,
      this.scaffoldKey,
      this.backgroundColor,
      this.cartState,
      this.addCustomTab,
      this.customLeading,
      this.trackingWidget,
      this.isTrackingPage = false,
      this.addBorderText,
      this.onAppNameRouteTap,
      this.isActionWidgetsAvailable = true,
      this.isCartIconWidgetsAvailable = true})
      : super(key: key);
  final double? height;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final CartState? cartState;
  final Color? backgroundColor;
  final bool? addCustomTab;
  final Widget? customLeading;
  final Widget? trackingWidget;
  final bool? isTrackingPage;
  final bool? isActionWidgetsAvailable;
  final bool? isCartIconWidgetsAvailable;
  final bool? addBorderText;
  final VoidCallback? onAppNameRouteTap;
  final String id = 'OD123MN45ADX';

  @override
  Widget build(BuildContext context) {
    final RouteMatch lastMatch =
        GoRouter.of(context).routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : GoRouter.of(context).routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    print('location: $location');
    return AppBar(
        backgroundColor: backgroundColor ?? nero,
        leading: _CustomAppBarWidgets._shrink,
        leadingWidth: _CustomAppBarWidgets._leadingWidth,
        actions: isActionWidgetsAvailable!
            ? _CustomAppBarWidgets._actionWidgets(context, cartState!,
                isTrackingPage: isTrackingPage,
                isCartIconAvailable: isCartIconWidgetsAvailable,
                cartOnTap: () => _cartDialog(context))
            : null,
        title: _CustomAppBarWidgets._appBarTitleRow(context, scaffoldKey!,
            onAppNameRouteTap: onAppNameRouteTap ?? null));
  }

  Future<void> _cartDialog(BuildContext context) async {
    return await ProductCartDialog.showDialog(context,
        maskColor: Colors.transparent,
        clickMaskDismiss: true,
        alignment: Alignment.topRight);
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);
}
