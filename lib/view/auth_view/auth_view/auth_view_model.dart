import 'package:new_weedus/export.dart';


class AuthViewModel extends ChangeNotifier {
  bool _isSignUp = false;
  bool _isPhoneAuth = false;

  bool get isSignUp => _isSignUp;

  bool get isPhoneAuth => _isPhoneAuth;

  void goToSignUp() {
    _isSignUp = !_isSignUp;
    _isPhoneAuth = false;
    notifyListeners();
  }

  void goToPhoneSignUp() {
    _isPhoneAuth = !_isPhoneAuth;
    _isSignUp = false;
    notifyListeners();
  }
}
