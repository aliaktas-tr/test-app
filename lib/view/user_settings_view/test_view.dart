import 'package:new_weedus/export.dart';

class CheckoutFormView extends StatelessWidget {
  CheckoutFormView({
    super.key,
    this.loginOnTap,
    this.hasSignIn,
    this.formKey,
  });

  final VoidCallback? loginOnTap;
  final bool? hasSignIn;
  final GlobalKey<FormState>? formKey;

  final TextEditingController _firstNameController =
  TextEditingController(text: 'Example');
  final TextEditingController _lastNameController =
  TextEditingController(text: 'User');
  final TextEditingController _dobController =
  TextEditingController(text: '01/01/2001');
  final TextEditingController _phoneController =
  TextEditingController(text: '(810) 810-1010');
  final double _titleFontSize = 20;
  final int _darkenValue = 20;
  final int _flexValue = 2;
  final String _customerTitle = 'Costumer';
  final String _alreadyHaveAccountTitle = 'Already have an account?';
  final String _loginTitle = ' Login';
  final String _nameTitle = 'First Name';
  final String _lastNameTitle = 'Last Name';
  final String _mobileTitle = 'Mobile Phone';
  final String _mobileHint = '(___) ___-____';
  final String _mobileInputFormatterMask = '(###) ###-####';
  final String _dobTitle = 'Birthdate';
  final String _dobHint = 'mm/dd/yyyy';
  final String _dobInputFormatterMask = '##/##/####';
  final double _fontSize = 13;
  final List<TextInputFormatter>? _inputFormatters = [
    FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]'))
  ];
  final EdgeInsetsGeometry _titlePadding =
  EdgeInsets.symmetric(horizontal: 4.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleAndLoginButton,
        _halfHeightSizedBox,
        _form,
      ],
    );
  }

  Widget get _titleAndLoginButton => Padding(
    padding: _titlePadding,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_title, _loginRichTextButton],
    ),
  );

  Widget get _title => AppViewWidgets.textMontserrat(_customerTitle,
      fontSize: _titleFontSize,
      color:nero,
      fontWeight: FontWeight.w600);

  Widget get _loginRichTextButton => hasSignIn!
      ? SizedBox.shrink()
      : Container(
      child: Center(
          child: RichText(
              text: TextSpan(
                  text: _alreadyHaveAccountTitle,
                  style: _textStyle(),
                  children: <TextSpan>[_textSpan]))));

  TextSpan get _textSpan => TextSpan(
      text: _loginTitle,
      style: _textStyle(fontColor: appColor.darken(_darkenValue)),
      recognizer: TapGestureRecognizer()..onTap = loginOnTap);

  Form get _form => Form(
      key: formKey,
      child: Column(children: [
        _firstAndLastName(),
        SizedBox(height: defaultSize),
        _phoneNumberAndDob()
      ]));

  Row _firstAndLastName() {
    return Row(children: [
      _expandedWidget(
          labelText: _nameTitle,
          textEditingController: _firstNameController,
          validator: validateName,
          inputFormatters: _inputFormatters),
      SizedBox(width: defaultSize),
      _expandedWidget(
          labelText: _lastNameTitle,
          textEditingController: _lastNameController,
          validator: validateLastName,
          inputFormatters: _inputFormatters)
    ]);
  }

  Row _phoneNumberAndDob() {
    return Row(children: [
      _expandedWidget(
          labelText: _mobileTitle,
          hintText: _mobileHint,
          textEditingController: _phoneController,
          inputFormatters: [inputFormatter(_mobileInputFormatterMask)],
          validator: validateMobile),
      SizedBox(width: defaultSize),
      _expandedWidget(
          labelText: _dobTitle,
          hintText: _dobHint,
          textEditingController: _dobController,
          inputFormatters: [inputFormatter(_dobInputFormatterMask)],
          validator: validateDot)
    ]);
  }

  Expanded _expandedWidget(
      {String? labelText,
        String? hintText,
        TextEditingController? textEditingController,
        List<TextInputFormatter>? inputFormatters,
        String? Function(String?)? validator}) =>
      Expanded(
          flex: _flexValue,
          child: CustomFormField(
              labelText: labelText,
              hintText: hintText,
              textEditingController: textEditingController,
              inputFormatters: inputFormatters,
              validator: validator));

  SizedBox get _halfHeightSizedBox => SizedBox(height: defaultSize / 2);

  TextStyle _textStyle({Color? fontColor}) {
    return GoogleFonts.montserrat(
        fontSize: _fontSize,
        fontWeight: FontWeight.normal,
        color: fontColor ??effectsBoxColor.darken(20));
  }
}