import 'package:new_weedus/export.dart';

class _SignInConstants {
  _SignInConstants._();

  static const int _darkenValue = 20;
  static const double _resetPassHeight = 36;
  static const double _loginTitleFontSize = 22;
  static const EdgeInsetsGeometry _resetPassPadding =
      EdgeInsets.only(right: halfDefaultSize);
  static const double _spinKitSize = 37.0;
  static const Duration _duration = Duration(milliseconds: 500);
  static const String _signInTitle = 'Sign In';
  static const _emailHint = 'Email';
  static const _passwordHint = 'Password';
  static const _resetPassTitle = 'Forgot Password?';
}

class SignInWidgets {
  static Widget signInView(BuildContext context, SignInViewModel viewModel,
          {VoidCallback? signInButtonOnTap,
          VoidCallback? resetPassButtonOnTap}) =>
      _signInFieldWidgets(
          context, viewModel, signInButtonOnTap!, resetPassButtonOnTap!);

  static Widget _signInFieldWidgets(
          BuildContext context,
          SignInViewModel viewModel,
          VoidCallback signInButtonOnTap,
          VoidCallback resetPassButtonOnTap) =>
      Padding(
          padding: EdgeInsets.all(defaultSize),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(alignment: Alignment.topLeft, child: _loginText),
                SizedBox(height: halfDefaultSize),
                _buildForm(
                    context, viewModel, signInButtonOnTap, resetPassButtonOnTap)
              ]));

  static Widget get _loginText =>
      AppViewWidgets.textMontserrat(_SignInConstants._signInTitle,
          fontSize: _SignInConstants._loginTitleFontSize,
          fontWeight: FontWeight.bold,
          color: nero);

  static Widget _buildForm(BuildContext context, SignInViewModel viewModel,
          VoidCallback signInButtonOnTap, VoidCallback resetPassButtonOnTap) =>
      Column(children: [
        _emailFormBuilder(viewModel),
        _passwordFormBuilder(context, viewModel, signInButtonOnTap),
        _resetPass(viewModel, resetPassButtonOnTap)
      ]);

  static TextFormBuilder _emailFormBuilder(SignInViewModel viewModel) =>
      TextFormBuilder(
          enabled: !viewModel.loading,
          prefix: Icons.mail_outline_outlined,
          hintText: _SignInConstants._emailHint,
          controller: viewModel.emailController,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
          validateFunction: Validations.validateEmail,
          focusNode: viewModel.emailFN,
          nextFocusNode: viewModel.passFN);

  static Widget _passwordFormBuilder(BuildContext context,
          SignInViewModel viewModel, VoidCallback signInButtonOnTap) =>
      Row(children: [
        Expanded(
            child: PasswordFormBuilder(
                enabled: !viewModel.loading,
                prefix: Icons.password,
                suffix: Ionicons.eye_outline,
                hintText: _SignInConstants._passwordHint,
                controller: viewModel.passwordController,
                textInputAction: TextInputAction.go,
                validateFunction: Validations.validatePassword,
                submitAction: signInButtonOnTap,
                obscureText: true,
                focusNode: viewModel.passFN)),
        _logButtonAndCircleIndicator(context,
            loading: viewModel.loading, onTap: signInButtonOnTap)
      ]);

  static Widget _resetPass(
          SignInViewModel viewModel, VoidCallback? resetPassRouteOnTap) =>
      Padding(
          padding: _SignInConstants._resetPassPadding,
          child: AppViewWidgets.customInkWell(
              onTap: resetPassRouteOnTap,
              child: SizedBox(
                  height: _SignInConstants._resetPassHeight,
                  child: Center(child: _resetPassText))));

  static Align get _resetPassText => Align(
      alignment: Alignment.centerRight,
      child: AppViewWidgets.textMontserrat(_SignInConstants._resetPassTitle,
          color: effectsBoxColor.darken(_SignInConstants._darkenValue),
          fontWeight: FontWeight.w500));

  static Row _logButtonAndCircleIndicator(BuildContext context,
          {bool? loading, VoidCallback? onTap}) =>
      Row(children: [
        _widthSizedBox,
        AnimatedSwitcher(
            duration: _SignInConstants._duration,
            reverseDuration: _SignInConstants._duration,
            child: loading!
                ? _circleIndicator(context)
                : AuthSignHoverButton(signButtonOnTap: onTap!))
      ]);

  static SizedBox get _widthSizedBox => SizedBox(width: defaultSize);

  static Widget _circleIndicator(BuildContext context) => Center(
      child: AppViewWidgets.spinKitFadingCircle(context,
          size: _SignInConstants._spinKitSize));

  static signInSnackBar(BuildContext context,
          GlobalKey<ScaffoldState> _scaffoldKey, String message) =>
      AppViewWidgets.customSnackBar(context, message,
          backgroundColor: Colors.redAccent,
          textColor: effectsBoxColor,
          fontWeight: FontWeight.w500,
          iconColor: effectsBoxColor);
}
