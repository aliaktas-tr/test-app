import 'package:new_weedus/export.dart';

class _SignUpConstants {
  _SignUpConstants._();

  static final double _buttonWidgetSize = 36.0;
  static final double _spinKitSize = 37.0;
  static final double _signupTitleFontSize = 22;
  static Duration _duration = Duration(milliseconds: 500);
}

class SignUpWidgets {
  static Widget signUpView(
          BuildContext context, SignUpViewModel signUpViewModel,
          {VoidCallback? signUpButtonOnTap}) =>
      Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            _signUpForm(context, signUpViewModel,
                signUpButtonOnTap: signUpButtonOnTap)
          ]);

  static Widget _signUpForm(
          BuildContext context, SignUpViewModel signUpViewModel,
          {VoidCallback? signUpButtonOnTap}) =>
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding: EdgeInsets.all(defaultSize),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _signTitle,
                      SizedBox(height: halfDefaultSize),
                      _nameFormBuilder(signUpViewModel),
                      _emailFormBuilder(signUpViewModel),
                      _passwordFormBuilder(signUpViewModel),
                      _confirmPassFormBuilder(
                          signUpViewModel, context, signUpButtonOnTap)
                    ]))
          ]);

  static TextFormBuilder _nameFormBuilder(SignUpViewModel signUpViewModel) =>
      TextFormBuilder(
          enabled: !signUpViewModel.loading,
          prefix: Icons.person,
          hintText: 'Full Name',
          controller: signUpViewModel.nameController,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          validateFunction: Validations.validateName,
          focusNode: signUpViewModel.usernameFN,
          nextFocusNode: signUpViewModel.emailFN);

  static TextFormBuilder _emailFormBuilder(SignUpViewModel signUpViewModel) =>
      TextFormBuilder(
          enabled: !signUpViewModel.loading,
          prefix: Icons.mail_outline_outlined,
          hintText: 'Email',
          controller: signUpViewModel.emailController,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
          validateFunction: Validations.validateEmail,
          focusNode: signUpViewModel.emailFN,
          nextFocusNode: signUpViewModel.passFN);

  static PasswordFormBuilder _passwordFormBuilder(
          SignUpViewModel signUpViewModel) =>
      PasswordFormBuilder(
        enabled: !signUpViewModel.loading,
        prefix: Icons.password,
        suffix: Ionicons.eye_outline,
        hintText: 'Password',
        controller: signUpViewModel.passwordController,
        textInputAction: TextInputAction.next,
        validateFunction: Validations.validatePassword,
        obscureText: true,
        focusNode: signUpViewModel.passFN,
        nextFocusNode: signUpViewModel.cPassFN,
      );

  static Row _confirmPassFormBuilder(SignUpViewModel signUpViewModel,
          BuildContext context, VoidCallback? signUpButtonOnTap) =>
      Row(
        children: [
          Expanded(
              child: PasswordFormBuilder(
                  enabled: !signUpViewModel.loading,
                  prefix: Icons.password,
                  hintText: 'Confirm Password',
                  controller: signUpViewModel.confirmPasswordController,
                  textInputAction: TextInputAction.done,
                  submitAction: signUpButtonOnTap,
                  validateFunction: Validations.validatePassword,
                  obscureText: true,
                  focusNode: signUpViewModel.cPassFN)),
          Row(children: [
            SizedBox(width: defaultSize),
            AnimatedSwitcher(
                duration: _SignUpConstants._duration,
                reverseDuration: _SignUpConstants._duration,
                child: signUpViewModel.loading
                    ? _circleIndicator(context)
                    : AuthSignHoverButton(signButtonOnTap: signUpButtonOnTap!))
          ])
        ],
      );

  static Widget get _signTitle =>
      Align(alignment: Alignment.topLeft, child: _signupTitleText);

  static Widget get _signupTitleText => AppViewWidgets.textMontserrat('Sign Up',
      fontSize: _SignUpConstants._signupTitleFontSize,
      fontWeight: FontWeight.bold,
      color: nero);
/*
  static Widget _buttonWidget({VoidCallback? signButtonOnTap}) =>
      AppViewWidgets.customInkWell(
          onTap: signButtonOnTap,
          child: Container(
              width: _SignUpConstants._buttonWidgetSize,
              height: _SignUpConstants._buttonWidgetSize,
              decoration: BoxDecoration(shape: BoxShape.circle, color: nero),
              child:
                  Icon(Icons.arrow_forward, size: 24, color: effectsBoxColor)));*/

  static Widget _circleIndicator(BuildContext context) => Center(
      child: AppViewWidgets.spinKitFadingCircle(context,
          size: _SignUpConstants._spinKitSize));
}
