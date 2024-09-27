import 'package:new_weedus/export.dart';

class AppState extends ChangeNotifier {
  bool? _isBusy;

  bool? get isBusy => _isBusy;

  set loading(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  int _pageIndex = 0;

  int get pageIndex {
    return _pageIndex;
  }

  set setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  static void toggleDrawer(
      {required GlobalKey<ScaffoldState> scaffoldKey}) async {
    if (scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.closeDrawer();
    } else {
      scaffoldKey.currentState!.openDrawer();
    }
  }
}
