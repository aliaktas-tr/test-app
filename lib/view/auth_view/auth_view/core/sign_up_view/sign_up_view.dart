import 'package:new_weedus/export.dart';


class SignUpView extends StatelessWidget {
  const SignUpView(
      {super.key,  this.loginCallBack,  this.scaffoldKey});

  final VoidCallback? loginCallBack;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    SignUpViewModel signUpViewModel = Provider.of<SignUpViewModel>(context);
    return _signUp(context, signUpViewModel);
  }

  Widget _signUp(BuildContext context, SignUpViewModel signUpViewModel) =>
      SignUpWidgets.signUpView(context, signUpViewModel,
          signUpButtonOnTap: () => signUpViewModel
              .submitForm(context, scaffoldKey!, loginCallBack: loginCallBack));
}
