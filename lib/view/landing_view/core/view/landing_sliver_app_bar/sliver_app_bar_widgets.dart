import 'package:new_weedus/export.dart';
import 'package:badges/badges.dart' as badges;

class _SliverAppBarConstants {
  _SliverAppBarConstants._();

  static final double _bottomPadding = 6.0;
  static final double _height = 45;
  static final String _path = 'assets/app/background-leaf2.png';
  static final String _appName = 'weedus';
  static final String _fontFamily = 'Neuropolitical';
  static final double _responseSize = 1010;
  static final String _menuTitle = 'Menu';
  static final double _menuFontSize = 16;
  static final String _shopTitle = 'Shop';
  static final String _upperCaseProductTitle = 'PRODUCTS';
  static final double _upperCaseProductTitleFontSize = 62;
  static final double _upperCaseProductTitleFontHeight = 1.1;
  static final double _switchBoxHeight = 36;
  static final double _switchBoxIconSize = 20;
  static final String _switchBoxTitle = 'Dispensary View';
  static final double _shopContainerWidth = 300;
  static final String _shopContainerBackgroundPath =
      'assets/app/smoke_background.png';
  static final String _dispensaryRoute = '/dispensaries';
  static final String _adminPanelRoute = '/admin_panel';
  static final double _productListWidth = 200;
  static const List<String>? _menuTitles = [
    'Dispensary',
    'Brands',
    'Education'
  ];
  static const List<String> _tabShopMenu = [
    "Flower",
    "Pre-Roll",
    "Concentrates",
    "Vaporizers",
    "Edibles",
    "Beverages",
    "Topical",
    "Tinctures",
    "Growing",
    "CBD",
    "Accessory",
    "Apparel"
  ];
  static EdgeInsetsGeometry _singleMenuPadding =
      EdgeInsets.only(left: 12, bottom: 6);
  static final double _fontSize = 16;
  static final double _budgeFontSize = 12;
  static final double _budgeTextHeight = 0.0;

  static final badges.BadgePosition _position =
      badges.BadgePosition.topEnd(top: -15, end: 0);
}

class SliverAppBarWidgets {
  static List<Widget> actionWidgets(BuildContext context, CartState cartState,
          AuthState authState, GlobalKey<ScaffoldState> scaffoldKey,
          {VoidCallback? cartOnTap}) =>
      [
        context.width <= _SliverAppBarConstants._responseSize
            ? _shrink
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: defaultSize, right: defaultSize),
                        child: Row(children: [
                          _shoppingCartIcon(cartState, cartOnTap: cartOnTap),
                          !cartState.hasPayment
                              ? _shrink
                              : OrderTrackingIconWidget(cartState),
                          SizedBox(width: defaultSize),
                          AppbarUserLoginView(context2: context)
                        ]))
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
        position: _SliverAppBarConstants._position,
        badgeAnimation: badges.BadgeAnimation.size(),
        showBadge: cart.cartItems!.isEmpty ? false : true,
        badgeStyle: badges.BadgeStyle(badgeColor: appColor),
        badgeContent: cart.cartItems!.isEmpty
            ? _shrink
            : AppViewWidgets.textMontserrat(cart.cartItems!.length.toString(),
                textAlign: TextAlign.center,
                fontSize: _SliverAppBarConstants._budgeFontSize,
                height: _SliverAppBarConstants._budgeTextHeight,
                fontWeight: FontWeight.w500),
        child: Icon(Zocial.cart,
            color: cart.itemCount < 1 ? Colors.grey.shade600 : appColor));
  }

  static Row appBarTitleRow(
          BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) =>
      Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            logoAndAppName,
            _doubleWidthSizedBox,
            Padding(
                padding: const EdgeInsets.only(bottom: quarterDefaultSize),
                child: customTabBar(context, scaffoldKey))
          ]);

  static SizedBox get _doubleWidthSizedBox => SizedBox(width: defaultSize);

  static Row get logoAndAppName => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(
                    bottom: _SliverAppBarConstants._bottomPadding),
                child: Image.asset(_SliverAppBarConstants._path,
                    height: _SliverAppBarConstants._height)),
            _halfWidthSizedBox(),
            Text(_SliverAppBarConstants._appName, style: _appNameTextStyle)
          ]);

  static SizedBox _halfWidthSizedBox() => SizedBox(width: halfDefaultSize);

  static SizedBox get _shrink => SizedBox.shrink();

  static Widget customTabBar(
          BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) =>
      context.width <= _SliverAppBarConstants._responseSize
          ? _singleTab(scaffoldKey)
          : _tabs(context);

  static Widget _singleTab(GlobalKey<ScaffoldState> scaffoldKey) =>
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
            padding: _SliverAppBarConstants._singleMenuPadding,
            child: AppViewWidgets.customInkWell(
                onTap: () => _menuOnTap(scaffoldKey),
                child: Text(_SliverAppBarConstants._menuTitle,
                    style: GoogleFonts.michroma(
                        fontSize: _SliverAppBarConstants._menuFontSize,
                        fontWeight: FontWeight.w400,
                        color: appColor))))
      ]);

  static Row _tabs(BuildContext context) =>
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        AppViewWidgets.windowsStyleCustomTabWidget(
            dropdownBackgroundColor: nero,
            titleColor: appColor,
            buttonTitle: _SliverAppBarConstants._shopTitle,
            children: [_productListContainer]),
        ..._tabMenu(context)
      ]);

  static void _menuOnTap(GlobalKey<ScaffoldState> scaffoldKey) =>
      AppState.toggleDrawer(scaffoldKey: scaffoldKey);

  static List<Widget> _tabMenu(BuildContext context) => List.generate(
      _SliverAppBarConstants._menuTitles!.length,
      (index) => TabWidget(
          title: _SliverAppBarConstants._menuTitles![index],
          color: appColor,
          onTap: () => _tabMenuTap(context, index)));

  static void _tabMenuTap(BuildContext context, int index) {
    var _menuRoute =
        '/${_SliverAppBarConstants._menuTitles![index].toLowerCase()}';
    if (index == 0) {
      context.go(_SliverAppBarConstants._dispensaryRoute);
    } else {
      context.go(_menuRoute);
    }
  }

  static Container get _productListContainer => Container(
      width: _SliverAppBarConstants._shopContainerWidth,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  _SliverAppBarConstants._shopContainerBackgroundPath),
              fit: BoxFit.cover)),
      child: _productList);

  static Row get _productList => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_productListRotateTitle, _productListBuilder],
      );

  static RotatedBox get _productListRotateTitle => RotatedBox(
      quarterTurns: -1,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultSize),
          child: AppViewWidgets.textMontserrat(
              _SliverAppBarConstants._upperCaseProductTitle,
              color: Colors.grey.withOpacity(0.09),
              fontSize: _SliverAppBarConstants._upperCaseProductTitleFontSize,
              fontWeight: FontWeight.w700,
              height:
                  _SliverAppBarConstants._upperCaseProductTitleFontHeight)));

  static SizedBox get _productListBuilder => SizedBox(
      width: _SliverAppBarConstants._productListWidth,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultSize),
          child: ProductMenuTitleListBuilder(
              menuList: _SliverAppBarConstants._tabShopMenu)));

  static Widget adminPanelSwitchBox(BuildContext context) => Padding(
      padding: const EdgeInsets.only(right: halfDefaultSize),
      child: InkWell(
          onTap: () => _goToAdminPanel(context),
          child: _adminPanelSwitchBoxContainer));

  static Widget get _adminPanelSwitchBoxContainer =>
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
            height: _SliverAppBarConstants._switchBoxHeight,
            padding: EdgeInsets.all(halfDefaultSize),
            child: _adminPanelSwitchBoxRow)
      ]);

  static Widget get _adminPanelSwitchBoxRow => Row(children: [
        AppViewWidgets.textMontserrat(_SliverAppBarConstants._switchBoxTitle,
            color: appColor, fontWeight: FontWeight.w600),
        SizedBox(width: quarterDefaultSize),
        Icon(Icons.swipe,
            color: appColor, size: _SliverAppBarConstants._switchBoxIconSize)
      ]);

  static TextStyle get _appNameTextStyle => TextStyle(
      fontFamily: _SliverAppBarConstants._fontFamily,
      fontSize: _SliverAppBarConstants._height,
      color: white9);

  static void _goToAdminPanel(BuildContext context) {
    context.go(_SliverAppBarConstants._adminPanelRoute);
  }
}
