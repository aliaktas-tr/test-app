import 'package:new_weedus/export.dart';

class ShopState extends ChangeNotifier {
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

  int _strainIndex = 0;

  int get strainIndex {
    return _strainIndex;
  }

  set setStrainIndex(int index) {
    _strainIndex = index;
    notifyListeners();
  }
}
