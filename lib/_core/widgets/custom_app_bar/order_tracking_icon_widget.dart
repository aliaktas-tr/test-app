import 'package:new_weedus/export.dart';
import 'package:badges/badges.dart' as badges;

class OrderTrackingIconWidget extends CustomAppBar {
  OrderTrackingIconWidget(this.cart, {Key? key}) : super(key: key);
  final CartState? cart;
  final double _budgeFontSize = 12;
  final double _budgeTextHeight = 0.0;
  final badges.BadgePosition _position =
      badges.BadgePosition.topEnd(top: -15, end: -10);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(width: defaultSize),
      //_shoppingCartBadge(context, cart!)
    ]);
  }

/*  Widget _shoppingCartBadge(BuildContext context, CartState cart) {
    return AppViewWidgets.customInkWell(
      onTap: () => context.go('/whereismyorder/$id'),
      child: badges.Badge(
          position: _position,
          badgeAnimation: badges.BadgeAnimation.size(),
          showBadge: cart.cartItems2.isEmpty ? false : true,
          badgeStyle: badges.BadgeStyle(badgeColor: appColor),
          badgeContent: cart.cartItems2.isEmpty
              ? _shrink
              : AppViewWidgets.textMontserrat(cart.cartItems2.length.toString(),
                  textAlign: TextAlign.center,
                  fontSize: _budgeFontSize,
                  height: _budgeTextHeight,
                  fontWeight: FontWeight.w500),
          child: Icon(FontAwesome.shopping_bag,
              color: cart.itemCount < 1 ? Colors.grey.shade600 : appColor)),
    );
  }*/

  SizedBox get _shrink => SizedBox.shrink();
}
