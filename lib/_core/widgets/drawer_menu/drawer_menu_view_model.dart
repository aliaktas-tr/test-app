import 'package:new_weedus/export.dart';

class DrawerMenuViewModel {
  static final String _dispensaryRoute = '/dispensaries';
  static final String _whereIsMyOrderRoute = '/whereismyorder/$_id';
  static final String _adminPanelRoute = '/admin_panel';
  static final String _id = 'OD123MN45ADX';
  static const List<String>? _menuTitles = [
    'Dispensary',
    'Brands',
    'Education',
    'Where Is My Order',
    'Admin View',
  ];

  static void menuOnTap(BuildContext context, int index) {
    var _menuRoute =
        '/${_menuTitles![index].toLowerCase().replaceAll(' ', '')}';
    if (index == 0) {
      context.go(_dispensaryRoute);
      context.pop();
    }
    if (index == 3) {
      goToWhereIsMyOrder(context);
      context.pop();
    } else {
      context.go(_menuRoute);
      context.pop();
    }
  }

  static void goToAdminPanel(BuildContext context) =>
      context.go(_adminPanelRoute);

  static void goToWhereIsMyOrder(BuildContext context) =>
      context.go(_whereIsMyOrderRoute);
}
