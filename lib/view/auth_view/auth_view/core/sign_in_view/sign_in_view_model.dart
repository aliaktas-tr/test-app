import 'package:new_weedus/export.dart';

class SignInViewModel extends ChangeNotifier {
  final String _resetPasswordRoute = '/reset-password';
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool validate = false;
  bool loading = false;
  String? email, password;
  FocusNode emailFN = FocusNode();
  FocusNode passFN = FocusNode();

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  void login(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
      {VoidCallback? loginCallBack}) {
    FocusManager.instance.primaryFocus!.unfocus();
    var state = Provider.of<AuthState>(context, listen: false);
    var isValid = Validations.validateCredentials(context, scaffoldKey,
        _emailController.text.trim(), _passwordController.text.trim());
    loading = true;
    notifyListeners();
    if (isValid) {
      state
          .signInWithEmailAndPassword(context, _emailController.text.trim(),
              _passwordController.text.trim())
          .then((status) {
        if (state.user != null) {
          loginCallBack!();
          loading = false;
          _emailController.clear();
          _passwordController.clear();
          notifyListeners();
        } else {
          if (kDebugMode) {
            cprint('Unable to login', errorIn: '_signInButton');
            loading = false;
            notifyListeners();
          }
        }
      }).whenComplete(() => SmartDialog.dismiss(force: true));
    } else {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> googleSignIn(
      BuildContext context, VoidCallback? loginCallback) async {
    var state = Provider.of<AuthState>(context, listen: false);
    await state
        .signInWithGoogle(context)
        .whenComplete(() => SmartDialog.dismiss(force: true));

    loading = true;
    notifyListeners();
    if (state.user != null) {
      loginCallback!();
      loading = false;
      notifyListeners();
    } else {
      loading = false;
      notifyListeners();
      if (kDebugMode) {
        cprint('Unable to login', errorIn: '_googleLoginButton');
      }
    }
  }

  void resetPasswordRoute(BuildContext context, SignInViewModel viewModel) =>
      context.go(_resetPasswordRoute);
}
