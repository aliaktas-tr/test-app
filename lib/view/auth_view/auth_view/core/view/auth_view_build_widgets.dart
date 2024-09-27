import 'package:new_weedus/export.dart';

class _AuthViewConstants {
  _AuthViewConstants._();

  static final String _backgroundImagePath = 'assets/top_header_image.png';
  static final String _orTitle = 'or';
  static final String _googleTitle = 'Google';
  static final String _googleLogoPath = 'assets/google.svg';
  static final String _phoneTitle = 'Phone';
  static final String _emailTitle = 'Email';
  static final String _separatorTitle = 'continue with';
  static final String _signInTitle = ' Sign in';
  static final String _signUpTitle = ' Sign up';
  static final String _haveAccountTitle = 'Already have an account? ';
  static final String _dontHaveAccountTitle = 'Don\'t have an account? ';

  static double _sizeValue = 0.8;

  static final double _subButtonsSize = 46.0;
  static final double _iconColorOpacityValue = 0.7;
  static final double _iconsSize = 20.0;

  static double _separatorSizeValue = 0.78;

  static final double _fontSize = 14;

  static double _size(BuildContext context) => context.width * _sizeValue;

  static double _separatorSize(BuildContext context) =>
      context.width * _separatorSizeValue;
}

class AuthViewWidgets {
  static Container backdropSubChild(BuildContext context,
          {double? width,
          double? height,
          Widget? child,
          bool? hasBorder = true}) =>
      Container(
          height: height,
          width: width ?? _AuthViewConstants._size(context),
          decoration: BoxDecoration(
              border: hasBorder! ? Border.all(color: nero, width: 0.3) : null,
              //borderRadius: BorderRadius.circular(halfDefaultSize),
              color: scaffoldBackgroundColor),
          child: child);

  static Widget landingBackgroundWidget({required Widget child}) => Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(_AuthViewConstants._backgroundImagePath),
              fit: BoxFit.fill)),
      child: child);

  static Widget _orSeparator(BuildContext context, {String? midString}) =>
      SizedBox(
          width: _AuthViewConstants._separatorSize(context),
          child: Row(children: [
            Expanded(child: _container()),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSize),
                child: AppViewWidgets.textMontserrat(
                    midString ?? _AuthViewConstants._orTitle)),
            Expanded(child: _container(isRightSide: true))
          ]));

  static Widget _container({bool isRightSide = false}) => Container(
      height: 1.5,
      margin: EdgeInsets.only(top: quarterDefaultSize),
      decoration: BoxDecoration(color: appColor));

  static Widget _authChooseButton({VoidCallback? onTap, bool? isSignUp}) =>
      Container(
          child: Center(
              child: RichText(
                  text: TextSpan(
                      text: isSignUp!
                          ? _AuthViewConstants._haveAccountTitle
                          : _AuthViewConstants._dontHaveAccountTitle,
                      style: _textStyle(nero),
                      children: <TextSpan>[
            TextSpan(
                text: isSignUp
                    ? _AuthViewConstants._signInTitle
                    : _AuthViewConstants._signUpTitle,
                style: _textStyle(nero, fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()..onTap = onTap)
          ]))));

  static TextStyle _textStyle(Color color, {FontWeight? fontWeight}) =>
      GoogleFonts.montserrat(
          color: color,
          fontSize: _AuthViewConstants._fontSize,
          fontWeight: fontWeight);

  static Widget signButtons(BuildContext context,
          {VoidCallback? gotoSignUp,
          VoidCallback? phoneAuthOnTap,
          VoidCallback? googleSignOnTap,
          bool? isSignUp,
          bool? isPhoneAuth}) =>
      Column(children: [
        _orSeparator(context, midString: _AuthViewConstants._separatorTitle),
        _doubleHeightSizedBox,
        SizedBox(
            width: _AuthViewConstants._size(context),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _phoneSignUpButton(context, phoneAuthOnTap,
                      isPhoneAuth: isPhoneAuth),
                  SizedBox(width: defaultSize),
                  _googleSignUpButton(context, googleSignOnTap)
                ])),
        _doubleHeightSizedBox,
        _authChooseButton(onTap: gotoSignUp, isSignUp: isSignUp)
      ]);

  static SizedBox get _halfHeightSizedBox => SizedBox(height: halfDefaultSize);

  static SizedBox get _doubleHeightSizedBox =>
      SizedBox(height: doubleDefaultSize);

  static Widget _phoneSignUpButton(
          BuildContext context, VoidCallback? phoneAuthOnTap,
          {bool? isPhoneAuth = false}) =>
      Expanded(
          child: AppViewWidgets.customInkWell(
              onTap: phoneAuthOnTap,
              child: backdropSubChild(context,
                  height: _AuthViewConstants._subButtonsSize,
                  child: !isPhoneAuth!
                      ? _phoneSignupButtonWidget
                      : _emailSignupButtonWidget)));

  static Widget get _phoneSignupButtonWidget => Center(
      child: _buttonChildren(Icons.phone, _AuthViewConstants._phoneTitle));

  static Widget get _emailSignupButtonWidget => Center(
      child: _buttonChildren(
          Icons.email_outlined, _AuthViewConstants._emailTitle));

  static Widget _buttonChildren(IconData icon, String text) => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon,
              color:
                  nero.withOpacity(_AuthViewConstants._iconColorOpacityValue),
              size: _AuthViewConstants._iconsSize),
          SizedBox(width: defaultSize),
          AppViewWidgets.textMontserrat(text,
              color: nero, fontWeight: FontWeight.w500)
        ],
      );

  static Widget _googleSignUpButton(
          BuildContext context, VoidCallback? googleSingIn) =>
      Expanded(
          child: AppViewWidgets.customInkWell(
              onTap: googleSingIn,
              child: backdropSubChild(context,
                  height: _AuthViewConstants._subButtonsSize,
                  child: _googleButtonIconAndTextRow)));

  static Widget get _googleButtonIconAndTextRow => Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(_AuthViewConstants._googleLogoPath,
                height: _AuthViewConstants._iconsSize),
            SizedBox(width: defaultSize),
            AppViewWidgets.textMontserrat(_AuthViewConstants._googleTitle,
                color: nero, fontWeight: FontWeight.w500)
          ]);
}
