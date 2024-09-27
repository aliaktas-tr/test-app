import 'package:new_weedus/export.dart';

class DrawerMenuView extends StatelessWidget {
  DrawerMenuView(
      {super.key,
      this.cart,
      this.orderStatusTabTitle,
      this.isCartWidgetAvailable = true,
      this.authState,
      required this.context});

  final CartState? cart;
  final BuildContext context;
  final AuthState? authState;
  final bool? isCartWidgetAvailable;
  final String? orderStatusTabTitle;
  final double _drawerWidth = 400;
  final EdgeInsetsGeometry _drawerChildPadding =
      EdgeInsets.symmetric(vertical: kToolbarHeight, horizontal: defaultSize);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: _drawerWidth,
        backgroundColor: nero,
        child: Padding(
            padding: _drawerChildPadding,
            child: DrawerWidgets.buildMenu(context,
                authState: authState,
                cart: cart,
                isCartWidgetAvailable: isCartWidgetAvailable,
                orderStatusTabTitle: orderStatusTabTitle)));
  }
}
