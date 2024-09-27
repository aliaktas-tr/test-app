import 'package:new_weedus/export.dart';

class AuthView extends StatelessWidget {
  const AuthView({
    super.key,
    required this.loginCallBack,
    required this.scaffoldKey,
  });

  final VoidCallback loginCallBack;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final double _width = 450;

  @override
  Widget build(BuildContext context) {
    SignInViewModel signInViewModel = Provider.of<SignInViewModel>(context);
    AuthViewModel authViewModel = Provider.of<AuthViewModel>(context);
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    width: _width,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: _build(context, authViewModel, signInViewModel)))
              ])
        ]));
  }

  Widget _build(BuildContext context, AuthViewModel authViewModel,
          SignInViewModel signInViewModel) =>
      Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            _signFields(context, authViewModel),
            _signButtons(context, authViewModel, signInViewModel)
          ]);

  Widget _signButtons(BuildContext context, AuthViewModel authViewModel,
          SignInViewModel signInViewModel) =>
      AuthViewWidgets.signButtons(context,
          isSignUp: authViewModel.isSignUp,
          isPhoneAuth: authViewModel.isPhoneAuth,
          gotoSignUp: () => authViewModel.goToSignUp(),
          phoneAuthOnTap: () => authViewModel.goToPhoneSignUp(),
          googleSignOnTap: () =>
              signInViewModel.googleSignIn(context, loginCallBack));

  Widget _signFields(BuildContext context, AuthViewModel authViewModel) =>
      AuthViewWidgets.backdropSubChild(context,hasBorder: false,
          child: authViewModel.isSignUp
              ? signUpView
              : authViewModel.isPhoneAuth
                  ? phoneAuthView
                  : signInView);

  SignUpView get signUpView =>
      SignUpView(loginCallBack: loginCallBack, scaffoldKey: scaffoldKey);

  PhoneAuthView get phoneAuthView =>
      PhoneAuthView(loginCallBack: loginCallBack, scaffoldKey: scaffoldKey);

  SignInView get signInView =>
      SignInView(loginCallBack: loginCallBack, scaffoldKey: scaffoldKey);
}
