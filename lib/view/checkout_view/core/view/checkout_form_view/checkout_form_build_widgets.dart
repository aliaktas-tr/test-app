import 'package:new_weedus/export.dart';

class _CheckoutFormConstants {
  _CheckoutFormConstants._();

  static final TextEditingController _firstNameController =
      TextEditingController(text: 'Example');
  static final TextEditingController _lastNameController =
      TextEditingController(text: 'User');
  static final TextEditingController _dobController =
      TextEditingController(text: '01/01/2001');
  static final TextEditingController _phoneController =
      TextEditingController(text: '(810) 810-1010');
  static final double _titleFontSize = 20;
  static final int _darkenValue = 20;
  static final int _flexValue = 2;
  static final String _customerTitle = 'Costumer';
  static final String _alreadyHaveAccountTitle = 'Already have an account?';
  static final String _loginTitle = ' Login';
  static final String _nameTitle = 'First Name';
  static final String _lastNameTitle = 'Last Name';
  static final String _mobileTitle = 'Mobile Phone';
  static final String _mobileHint = '(___) ___-____';
  static final String _mobileInputFormatterMask = '(###) ###-####';
  static final String _dobTitle = 'Birthdate';
  static final String _dobHint = 'mm/dd/yyyy';
  static final String _dobInputFormatterMask = '##/##/####';
  static final double _fontSize = 13;
  static final List<TextInputFormatter>? _inputFormatters = [
    FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]'))
  ];
  static final EdgeInsetsGeometry _titlePadding =
      EdgeInsets.symmetric(horizontal: 4.0);
  

}

class CheckoutFormBuildWidgets {
  static Column buildWidget(
          {bool? hasSignIn,
          VoidCallback? loginOnTap,
          GlobalKey<FormState>? formKey}) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _titleAndLoginButton(hasSignIn, loginOnTap!),
        _halfHeightSizedBox,
        _form(formKey!)
      ]);

  static Padding _titleAndLoginButton(
          bool? hasSignIn, VoidCallback loginOnTap) =>
      Padding(
        padding: _CheckoutFormConstants._titlePadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_title, _loginRichTextButton(hasSignIn, loginOnTap)],
        ),
      );

  static Widget get _title =>
      AppViewWidgets.textMontserrat(_CheckoutFormConstants._customerTitle,
          fontSize: _CheckoutFormConstants._titleFontSize,
          color: nero,
          fontWeight: FontWeight.w600);

  static Widget _loginRichTextButton(
          bool? hasSignIn, VoidCallback loginOnTap) =>
      hasSignIn!
          ? SizedBox.shrink()
          : Container(
              child: Center(
                  child: RichText(
                      text: TextSpan(
                          text: _CheckoutFormConstants._alreadyHaveAccountTitle,
                          style: _textStyle(),
                          children: <TextSpan>[_textSpan(loginOnTap)]))));

  static TextSpan _textSpan(VoidCallback loginOnTap) => TextSpan(
      text: _CheckoutFormConstants._loginTitle,
      style: _textStyle(
          fontColor: appColor.darken(_CheckoutFormConstants._darkenValue)),
      recognizer: TapGestureRecognizer()..onTap = loginOnTap);

  static Form _form(GlobalKey<FormState> formKey) => Form(
      key: formKey,
      child: Column(children: [
        _firstAndLastName(),
        SizedBox(height: defaultSize),
        _phoneNumberAndDob()
      ]));

  static Row _firstAndLastName() {
    return Row(children: [
      _expandedWidget(
          labelText: _CheckoutFormConstants._nameTitle,
          textEditingController: _CheckoutFormConstants._firstNameController,
          validator: validateName,
          inputFormatters: _CheckoutFormConstants._inputFormatters),
      SizedBox(width: defaultSize),
      _expandedWidget(
          labelText: _CheckoutFormConstants._lastNameTitle,
          textEditingController: _CheckoutFormConstants._lastNameController,
          validator: validateLastName,
          inputFormatters: _CheckoutFormConstants._inputFormatters)
    ]);
  }

  static Row _phoneNumberAndDob() {
    return Row(children: [
      _expandedWidget(
          labelText: _CheckoutFormConstants._mobileTitle,
          hintText: _CheckoutFormConstants._mobileHint,
          textEditingController: _CheckoutFormConstants._phoneController,
          inputFormatters: [
            inputFormatter(_CheckoutFormConstants._mobileInputFormatterMask)
          ],
          validator: validateMobile),
      SizedBox(width: defaultSize),
      _expandedWidget(
          labelText: _CheckoutFormConstants._dobTitle,
          hintText: _CheckoutFormConstants._dobHint,
          textEditingController: _CheckoutFormConstants._dobController,
          inputFormatters: [
            inputFormatter(_CheckoutFormConstants._dobInputFormatterMask)
          ],
          validator: validateDot)
    ]);
  }

  static Expanded _expandedWidget(
          {String? labelText,
          String? hintText,
          TextEditingController? textEditingController,
          List<TextInputFormatter>? inputFormatters,
          String? Function(String?)? validator}) =>
      Expanded(
          flex: _CheckoutFormConstants._flexValue,
          child: CustomFormField(
              labelText: labelText,
              hintText: hintText,
              textEditingController: textEditingController,
              inputFormatters: inputFormatters,
              validator: validator));

  static SizedBox get _halfHeightSizedBox => SizedBox(height: halfDefaultSize);

  static TextStyle _textStyle({Color? fontColor}) {
    return GoogleFonts.montserrat(
        fontSize: _CheckoutFormConstants._fontSize,
        fontWeight: FontWeight.normal,
        color: fontColor ?? effectsBoxColor.darken(_CheckoutFormConstants._darkenValue));
  }
}
