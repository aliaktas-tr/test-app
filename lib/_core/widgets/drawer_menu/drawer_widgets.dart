import 'package:new_weedus/export.dart';

class _DrawerWidgetsConstants {
  _DrawerWidgetsConstants._();

  static final String _shopTitle = 'Shop';
  static final String _menuVerticalTitle = 'PRODUCTS';
  static final String _menuBackgroundPath = 'assets/app/smoke_background.png';

  //static final String _dispensaryViewTitle = 'Dispensary View';
  static final String _adminTitle = 'Admin View';
  static final String _cartTitle = 'Cart';
  static final String _orderStatusTitle = 'Order Status';
  static final String _emptyCartTitle = 'Your cart is empty.';
  static final String _singleItemInCartTitle = 'product in your cart.';
  static final String _multiItemInCartTitle = 'products in your cart.';
  static final String _signInTitle = 'Sign In';
  static const List<String>? _menuTitles = [
    'Dispensary',
    'Brands',
    'Education',
    'Where Is My Order',
    'Admin View',
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

  static final double _menuVerticalTitleFontSize = 60;
  static final double _menuWidth = 400;
  static final double _menuFontSize = 20;

  // static final double _adminPanelFontSize = 18;
  static final double _titleFontSize = 16;
  static final double _fontSize = 14;
  static final double _switchIconSize = 40;
  static final double _rightPadding = 20.0;
  static final double _buttonHeight = 36.0;
}

class DrawerWidgets {
  static Widget buildMenu(BuildContext context,
          {bool? isCartWidgetAvailable,
          CartState? cart,
          AuthState? authState,
          String? orderStatusTabTitle}) =>
      SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          /*  Responsive.isMobile(context)
              ? isCartWidgetAvailable!
                  ?  cartWidgets(context,
                      cart: cart, orderStatusTabTitle: orderStatusTabTitle)
                  : _shrink
              : _shrink,*/
          _userCard(context, authState!),
          _buildSizedBox,
          _shopMenuWidgets
        ]),
      );

  //static SizedBox get _buildHeightSizedBox => SizedBox(height: defaultSize);

  static SizedBox get _buildSizedBox => SizedBox(height: defaultSize * 1.5);

  static SizedBox _userCard(BuildContext context, AuthState authState) =>
      SizedBox(
          width: context.width,
          child: Card(
              color: appColor,
              margin: EdgeInsets.zero,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: halfDefaultSize),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: defaultSize),
                                padding: EdgeInsets.all(quarterDefaultSize),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: nero05,
                                        width: quarterDefaultSize)),
                                child: Icon(Icons.person_outline,
                                    color: nero05,
                                    size: _DrawerWidgetsConstants
                                        ._switchIconSize)),
                            SizedBox(width: halfDefaultSize),
                            authState.userModel == null
                                ? Expanded(
                                    child: AppViewWidgets.customInkWell(
                                        onTap: () {},
                                        child: _text(
                                            _DrawerWidgetsConstants
                                                ._signInTitle,
                                            color: nero,
                                            fontSize: defaultSize)))
                                : _shrink
                          ],
                        ),
                        authState.user != null
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: defaultSize, top: halfDefaultSize),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _text(authState.userModel!.displayName!,
                                          fontSize: _DrawerWidgetsConstants
                                              ._titleFontSize),
                                      _text(authState.userModel!.phoneNumber ??
                                          ''),
                                      _text(authState.userModel!.address ?? ''),
                                    ]))
                            : _shrink
                      ]))));

  static Row _text(String title, {double? fontSize, Color? color}) =>
      Row(children: [
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: halfDefaultSize),
                child: Text(title, style: GoogleFonts.michroma())))
      ]);

  static SizedBox get _shrink => SizedBox.shrink();

  static Widget get _shopMenuWidgets =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TabWidget(
            title: _DrawerWidgetsConstants._shopTitle,
            color: appColor,
            fontSize: _DrawerWidgetsConstants._menuFontSize),
        SizedBox(height: halfDefaultSize),
        menuContainer,
        _buildSizedBox,
        menuList
      ]);

  static Widget get menuContainer => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultSize),
          image: DecorationImage(
              image: AssetImage(_DrawerWidgetsConstants._menuBackgroundPath),
              fit: BoxFit.cover)),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_productList, _menuVerticalText]));

  static Widget get _productList => SizedBox(
      width: _DrawerWidgetsConstants._menuWidth,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultSize),
          child: ProductMenuTitleListBuilder(
              menuList: _DrawerWidgetsConstants._tabShopMenu)));

  static Widget get _menuVerticalText =>
      AppViewWidgets.textMontserrat(_DrawerWidgetsConstants._menuVerticalTitle,
          color: Colors.grey.withOpacity(0.09),
          fontSize: _DrawerWidgetsConstants._menuVerticalTitleFontSize,
          fontWeight: FontWeight.w700);

  static Widget get menuList => ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: quarterDefaultSize),
          child: UnderLineTextHover(
              isUnderLineHover: false,
              fontSize: _DrawerWidgetsConstants._menuFontSize,
              currentColor: appColor,
              title: _DrawerWidgetsConstants._menuTitles![index],
              onTap: () => DrawerMenuViewModel.menuOnTap(context, index))),
      separatorBuilder: (context, index) =>
          AppViewWidgets.appDivider(thickness: 0.15),
      itemCount: _DrawerWidgetsConstants._menuTitles!.length);

/*  static Widget cartWidgets(BuildContext context,
          {CartState? cart, String? orderStatusTabTitle}) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cartStatusWidget(context),
            _halfHeightSizedBox,
            _cartHasPaymentStatusWidget(context, cart),
            _halfHeightSizedBox,
            _divider,
            _halfHeightSizedBox
          ],
        ),
        !cart!.hasPayment
            ? _shrink
            : whereIsMyOrderMenuWidget(context,
                orderStatusTabTitle: orderStatusTabTitle)
      ]);*/

/*  static Widget _cartStatusWidget(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: quarterDefaultSize),
      child: UnderLineTextHover(
          isUnderLineHover: false,
          fontSize: _DrawerWidgetsConstants._menuFontSize,
          title: _DrawerWidgetsConstants._cartTitle,
          onTap: () => DrawerMenuViewModel.goToCartSheet(context)));

  static Widget _cartHasPaymentStatusWidget(
          BuildContext context, CartState? cart) =>
      cart!.itemCount <= 0
          ? drawerTitle(_DrawerWidgetsConstants._emptyCartTitle,
              fontSize: _DrawerWidgetsConstants._fontSize,
              color: Colors.grey.shade600)
          : TabWidget(
              fontSize: _DrawerWidgetsConstants._fontSize,
              title: cart.itemCount < 2
                  ? '${cart.itemCount.toString()} ${_DrawerWidgetsConstants._singleItemInCartTitle}'
                  : '${cart.itemCount.toString()} ${_DrawerWidgetsConstants._multiItemInCartTitle}',
              color: appColor,
              onTap: () => DrawerMenuViewModel.goToCartSheet(context));*/

  static Widget whereIsMyOrderMenuWidget(BuildContext context,
          {String? orderStatusTabTitle}) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _orderStatusText(context),
        _halfHeightSizedBox,
        _tabStatusWidget(orderStatusTabTitle, context),
        _halfHeightSizedBox,
        _divider,
        _halfHeightSizedBox
      ]);

  static Widget _orderStatusText(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: quarterDefaultSize),
      child: UnderLineTextHover(
          isUnderLineHover: false,
          fontSize: _DrawerWidgetsConstants._titleFontSize,
          title: _DrawerWidgetsConstants._orderStatusTitle,
          onTap: () => DrawerMenuViewModel.goToWhereIsMyOrder(context)));

  static Widget _tabStatusWidget(
          String? orderStatusTabTitle, BuildContext context) =>
      TabWidget(
          title: orderStatusTabTitle!,
          fontSize: _DrawerWidgetsConstants._fontSize,
          color: appColor,
          onTap: () => DrawerMenuViewModel.goToWhereIsMyOrder(context));

  static Widget get _divider => AppViewWidgets.appDivider(color: white9);

  static Widget get _halfHeightSizedBox => SizedBox(height: halfDefaultSize);

  static Widget adminPanelSwitcherButton(BuildContext context,
          {Color? currentColor, FontWeight? fontWeight, double? fontSize}) =>
      Padding(
          padding:
              EdgeInsets.only(right: _DrawerWidgetsConstants._rightPadding),
          child: Row(children: [
            UnderLineTextHover(
                isUnderLineHover: false,
                currentColor: currentColor ?? nero,
                fontWeight: fontWeight ?? FontWeight.w600,
                fontSize: fontSize,
                title: _DrawerWidgetsConstants._adminTitle,
                onTap: () => DrawerMenuViewModel.goToAdminPanel(context)),
            SizedBox(width: quarterDefaultSize),
            Icon(Icons.swipe,
                color: currentColor ?? nero,
                size: fontSize ?? _DrawerWidgetsConstants._titleFontSize)
          ]));

  static Widget testButton(BuildContext context) => InkWell(
        borderRadius: BorderRadius.all(Radius.circular(defaultSize)),
        onTap: () => DrawerMenuViewModel.goToAdminPanel(context),
        child: Container(
            height: _DrawerWidgetsConstants._buttonHeight,
            padding: EdgeInsets.symmetric(horizontal: defaultSize),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(defaultSize)),
                color: appColor,
                boxShadow: [
                  BoxShadow(
                      color: nero,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(1, 2))
                ]),
            child: Row(
              children: [
                Text(_DrawerWidgetsConstants._adminTitle,
                    style: GoogleFonts.michroma(fontWeight: FontWeight.w600)),
                SizedBox(width: halfDefaultSize),
                Icon(Icons.swipe,
                    color: nero, size: _DrawerWidgetsConstants._titleFontSize)
              ],
            )),
      );

  static Widget drawerTitle(String title,
          {double? fontSize, Color? color, FontWeight? fontWeight}) =>
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: quarterDefaultSize),
          child: Text(title,
              style: GoogleFonts.michroma(
                  fontSize: fontSize ?? _DrawerWidgetsConstants._titleFontSize,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  color: color ?? white9)));
}
