import 'package:new_weedus/export.dart';

class CheckoutOrderViewModel extends ChangeNotifier {
  bool? _expand = false;
  Timer? _timer;
  bool _displayAllTaxes = false;

  bool get expand => _expand!;

  bool get displayAllTaxes => _displayAllTaxes;

  void cartOnTap() {
    _expand = true;
    notifyListeners();
    if (_expand!) {
      _timer = Timer(Duration(seconds: 5), () {
        _expand = false;
        notifyListeners();
      });
    }
    return;
  }

  void taxIconTap() {
    _displayAllTaxes = !_displayAllTaxes;
    notifyListeners();
  }

  void errorCloseTap() {
    _expand = false;
    _timer!.cancel();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}

/*mixin CheckoutOrderViewMixin on State<CheckOutOrderView> {
  bool? _expand = false;
  Timer? _timer;
  bool _displayAllTaxes = false;

  void cartOnTap() {
    setState(() {
      _expand = true;
    });
    if (_expand!) {
      _timer = Timer(Duration(seconds: 5), () {
        if (mounted) {
          setState(() {
            _expand = false;
          });
        }
      });
    }
    return;
  }

  void taxIconTap() {
    setState(() {
      _displayAllTaxes = !_displayAllTaxes;
    });
  }

  void errorCloseTap() {
    setState(() {
      _expand = false;
      _timer!.cancel();
    });
  }

  bool get expand => _expand!;

  bool get displayAllTaxes => _displayAllTaxes;
}*/
