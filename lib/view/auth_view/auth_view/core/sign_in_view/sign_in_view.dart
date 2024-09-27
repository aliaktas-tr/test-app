import 'package:new_weedus/export.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key, this.loginCallBack, this.scaffoldKey});

  final VoidCallback? loginCallBack;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    SignInViewModel signInViewModel = Provider.of<SignInViewModel>(context);
    return SignInWidgets.signInView(context, signInViewModel,
        signInButtonOnTap: () => signInViewModel.login(context, scaffoldKey!,
            loginCallBack: loginCallBack),
        resetPassButtonOnTap: () =>
            signInViewModel.resetPasswordRoute(context, signInViewModel));
  }
}
