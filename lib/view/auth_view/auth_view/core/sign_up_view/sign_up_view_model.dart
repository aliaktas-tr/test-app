import 'package:new_weedus/export.dart';

class SignUpViewModel extends ChangeNotifier {
  final AuthState authState = AuthState();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool validate = false;
  bool loading = false;
  String? username, email, country, password, cPassword;
  FocusNode usernameFN = FocusNode();
  FocusNode emailFN = FocusNode();
  FocusNode countryFN = FocusNode();
  FocusNode passFN = FocusNode();
  FocusNode cPassFN = FocusNode();

  final double _minNameLength = 3;
  final double _maxNameLength = 27;

  void submitForm(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
      {VoidCallback? loginCallBack}) {
    FocusManager.instance.primaryFocus!.unfocus();

    var isValidEmail = Utility.validateEmail(emailController.text.trim());
    if (!isValidEmail) {
      SignInWidgets.signInSnackBar(context, scaffoldKey, 'invalidEmail'.tr());
      return;
    }

    var isValid = Validations.validateCredentials(context, scaffoldKey,
        emailController.text.trim(), passwordController.text.trim());

    if (emailController.text.isEmpty) {
      SignInWidgets.signInSnackBar(context, scaffoldKey, 'enterEmail'.tr());
      return;
    }

    if (nameController.text.length < _minNameLength) {
      SignInWidgets.signInSnackBar(context, scaffoldKey, 'shortName'.tr());
      return;
    }
    if (nameController.text.length > _maxNameLength) {
      SignInWidgets.signInSnackBar(context, scaffoldKey, 'longName'.tr());
      return;
    }

    if (emailController.text.isEmpty ||
        nameController.text.isEmpty ||
        passwordController.text.isEmpty) {
      SignInWidgets.signInSnackBar(context, scaffoldKey, 'fillForm'.tr());
      return;
    } else if (passwordController.text != confirmPasswordController.text) {
      SignInWidgets.signInSnackBar(context, scaffoldKey, 'notMatch'.tr());
      return;
    }
    loading = true;
    notifyListeners();

    if (isValid) {
      var user = UserModel(
          email: emailController.text.trim().toLowerCase(),
          displayName: nameController.text,
          profileImage: '',
          isVerified: false);
      authState
          .signUpWithEmailAndPassword(
              context, emailController.text, passwordController.text, user)
          /*   authState
          .signUp(context, user, password: passwordController.text)*/
          .then((status) {
        //_submit(context, scaffoldKey);
      }).whenComplete(() {
        SmartDialog.dismiss(force: true);
        Future.delayed(Duration(seconds: 1), () {
          loading = false;
          emailController.clear();
          passwordController.clear();
          confirmPasswordController.clear();
          nameController.clear();
          notifyListeners();
          if (authState.authStatus == AuthStatus.LOGGED_IN) {
            loginCallBack!();
          }
        });
      });
    } else {
      loading = false;
      notifyListeners();
    }
  }

/*  void _submit(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    var state = Provider.of<AuthState>(context, listen: false);
   state.sendEmailVerification(context, scaffoldKey);
  }*/

  void uploadProfileImage(
      BuildContext context,
      UploadProfileImageViewModel viewModel,
      GlobalKey<ScaffoldState> _scaffoldKey) async {
    loading = true;
    notifyListeners();
    var authState = Provider.of<AuthState>(context, listen: false);
    var model = authState.userModel!.copyWith(
        profileImage: authState.userModel!.profileImage,
        displayName: nameController.text);
    await authState.updateUserProfile(model,/* profileImage: viewModel.mediaUrl*/);
    loading = false;
    notifyListeners();
  }
}
