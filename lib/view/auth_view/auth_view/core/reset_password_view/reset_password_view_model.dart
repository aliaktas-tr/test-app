
import 'package:new_weedus/export.dart';


class ResetPasswordViewModel extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool validate = false;
  bool loading = false;
  String? email;
  final String _processDoneText = 'Please check your email for instructions '
      'to reset your password';
  static final int _durationValue = 3;
  final Duration _duration = Duration(seconds: _durationValue);

  forgotPassword(AuthState authState, BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey, String email) async {
    FormState form = _formKey.currentState!;
    form.save();
    loading = true;
    notifyListeners();

    if (Validations.validateEmail(email) != null) {
      AppViewWidgets.customSnackBar(
          context,  'invalidEmail'.tr());
    } else {
      try {
        FocusManager.instance.primaryFocus!.unfocus();
      /*  await authState.forgetPassword(context, email,
            scaffoldKey: scaffoldKey);*/
        loading = false;
        notifyListeners();
        AppViewWidgets.customSnackBar(context,  _processDoneText);
        Future.delayed(_duration, () => Navigator.pop(context));
      } on FirebaseAuthException catch (error) {
        if (error.code == 'user-not-found') {
          AppViewWidgets.customSnackBar(
              context,  'authUserNotFound'.tr());
        } else if (error.code == 'user-disabled') {
          AppViewWidgets.customSnackBar(
              context,  'authUserDisabled'.tr());
        } else {
          AppViewWidgets.customSnackBar(
              context,  '${error.toString()}');
        }
      }
    }
    loading = false;
    notifyListeners();
  }

  void submit(BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey,
      TextEditingController _emailController) {
    var state = Provider.of<AuthState>(context, listen: false);
   /* state.forgetPassword(context, _emailController.text.trim(),
        scaffoldKey: _scaffoldKey);*/
    if (_emailController.text.isEmpty) {
      AppViewWidgets.customSnackBar(
          context,  'enterEmail'.tr());
      return;
    }
    var isValidEmail = Utility.validateEmail(
      _emailController.text.trim(),
    );
    if (!isValidEmail) {
      AppViewWidgets.customSnackBar(
          context,  'invalidEmail'.tr());
      return;
    }
    if (isValidEmail) {
      Future.delayed(Duration(seconds: 3), () {
        context.pop();
      });
    }
  }

  setEmail(val) {
    email = val;
    notifyListeners();
  }

  GlobalKey<FormState> get formKey => _formKey;
}
