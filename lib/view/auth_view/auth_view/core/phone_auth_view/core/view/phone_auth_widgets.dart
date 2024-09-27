import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:new_weedus/export.dart';

class _PhoneAuthConstants {
  _PhoneAuthConstants._();

  static final double _halfWidthBorderValue = 0.5;
  static final double _borderWidthValue = 1.0;
  static final double _sizeValue = 15;
  static final double _suffixIconSize = 18;
  static final int _darkenValue = 20;
  static final double _zeroValue = 0.0;
  static final double _opacityValue = 0.6;

  //static final Color _color = effectsBoxColor.withOpacity(_opacityValue);
  static final double _minWidth = 30;
  static final double _maxHeight = 25;
  static final BoxConstraints _prefixIconConstraints =
      BoxConstraints(minWidth: _minWidth, maxHeight: _maxHeight);

  static final _effectBoxColor = effectsBoxColor.darken(_darkenValue);
  static final EdgeInsetsGeometry _contentPadding = EdgeInsets.only(top: 12);
  static final double _buttonWidgetSize = 36.0;
  static final double _loginTitleFontSize = 22;
  static final double _spinKitSize = 37.0;
  static final double _pinFieldSizeValue = 30.0;
  static final double _cursorHeight = 20.0;
  static final double _phoneFieldHeight = 52.0;
  static int _codeLength = 6;

  static PinTheme _pinTheme(BuildContext context) => PinTheme(
      fieldHeight: _PhoneAuthConstants._pinFieldSizeValue,
      fieldWidth: _PhoneAuthConstants._pinFieldSizeValue,
      shape: PinCodeFieldShape.underline,
      inactiveFillColor: Theme.of(context).scaffoldBackgroundColor,
      inactiveColor: nero,
      activeFillColor: scaffoldBackgroundColor,
      selectedFillColor: Colors.transparent,
      activeColor: Colors.white,
      selectedColor: nero);

  static final int _durationValue = 100;

  static final Duration _pinAnimationDuration =
      Duration(milliseconds: _durationValue);

  static final String _phoneHint = 'Phone Number';
  static final String _searchHint = 'Search Country';
  static final String _sendingCodeTitle = 'Sending code';
  static final String _sendCodeTitle = 'Send verification code';
  static final String _resendCodeTitle = 'Resend Code';

  static UnderlineInputBorder get _border => UnderlineInputBorder(
      borderSide: BorderSide(color: nero, width: _halfWidthBorderValue));

  static UnderlineInputBorder get _focusBorder => UnderlineInputBorder(
      borderSide: BorderSide(color: nero, width: _borderWidthValue));

  static Widget _prefixIcon(BuildContext context, {IconData? prefix}) =>
      Icon(prefix, size: _sizeValue, color: nero);

  static Widget _suffixIcon(BuildContext context, {IconData? suffix}) =>
      Icon(suffix, size: _suffixIconSize, color: nero);

  static TextStyle _textFieldHintStyle =
      GoogleFonts.montserrat(fontWeight: FontWeight.w400, color: _effectBoxColor);

  static TextStyle _textStyle =
      GoogleFonts.montserrat(fontWeight: FontWeight.w500, color: nero);

  static TextStyle _counterStyle =
      GoogleFonts.montserrat(fontWeight: FontWeight.w400, color: nero);

  static InputDecoration decoration(BuildContext context,
          {IconData? prefix, String? hintText, IconData? suffix}) =>
      InputDecoration(
          prefixIcon: _prefixIcon(context, prefix: prefix),
          suffixIcon: _suffixIcon(context, suffix: suffix),
          prefixIconConstraints: _prefixIconConstraints,
          filled: false,
          isDense: true,
          hintText: hintText,
          hintStyle: _textFieldHintStyle,
          contentPadding: _contentPadding,
          enabledBorder: _border,
          focusedBorder: _focusBorder,
          counterStyle: _counterStyle,
          border: _border,
          errorStyle: TextStyle(height: _zeroValue, fontSize: _zeroValue));

  static PickerDialogStyle _pickerDialogStyle(BuildContext context) =>
      PickerDialogStyle(
          countryNameStyle: _textFieldHintStyle,
          countryCodeStyle: _textFieldHintStyle,
          searchFieldCursorColor: effectsBoxColor,
          searchFieldTextStyle: _textFieldHintStyle,
          padding: EdgeInsets.zero,
          searchFieldPadding: EdgeInsets.zero,
          listTileDivider: Divider(height: 0),
          searchFieldInputDecoration:
              decoration(context, hintText: _searchHint));
}

class PhoneAuthWidgets {
  static Widget build(BuildContext context,
          {VoidCallback? signButtonOnTap,
          Function(PhoneNumber)? onChanged,
          Function(String)? onCompleted,
          Function(Country)? onCountryChanged,
          VoidCallback? resendCodeButtonOnTap,
          TextEditingController? optController,
          bool? optSending,
          MobileVerificationState? mobileVerificationState}) =>
      Padding(
          padding: EdgeInsets.all(defaultSize),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(alignment: Alignment.topLeft, child: _loginText),
                SizedBox(height: defaultSize),
                _buildWidgets(context,
                    signButtonOnTap: signButtonOnTap,
                    onChanged: onChanged,
                    onCompleted: onCompleted,
                    onCountryChanged: onCountryChanged,
                    optController: optController,
                    optSending: optSending,
                    mobileVerificationState: mobileVerificationState,
                    resendCodeButtonOnTap: () {})
              ]));

  static Widget get _loginText => AppViewWidgets.textMontserrat('signIn',
      fontSize: _PhoneAuthConstants._loginTitleFontSize,
      fontWeight: FontWeight.bold,
      color: effectsBoxColor);

  static Widget _buildWidgets(BuildContext context,
          {VoidCallback? signButtonOnTap,
          Function(PhoneNumber)? onChanged,
          Function(String)? onCompleted,
          Function(Country)? onCountryChanged,
          VoidCallback? resendCodeButtonOnTap,
          TextEditingController? optController,
          bool? optSending,
          MobileVerificationState? mobileVerificationState}) =>
      Column(children: [
        mobileVerificationState ==
                MobileVerificationState.SHOW_MOBILE_FORM_STATE
            ? Column(children: [
                getPhone(context,
                    onChanged: onChanged, onCountryChanged: onCountryChanged),
                _buttonWidget(context,
                    signButtonOnTap: signButtonOnTap, optSending: optSending)
              ])
            : codeField(context,
                controller: optController,
                onCompleted: onCompleted,
                optSending: optSending,
                resendCodeButtonOnTap: resendCodeButtonOnTap)
      ]);

  static Widget getPhone(BuildContext context,
          {Function(PhoneNumber)? onChanged,
          Function(Country)? onCountryChanged}) =>
      SizedBox(
          height: _PhoneAuthConstants._phoneFieldHeight,
          child: IntlPhoneField(
              style: _PhoneAuthConstants._textStyle,
              dropdownTextStyle: _PhoneAuthConstants._textStyle,
              initialCountryCode: 'US',

              readOnly: true,
              // context.locale.toString().toUpperCase(),
              cursorColor: effectsBoxColor,
              enabled: false,
              dropdownIcon:
                  Icon(Icons.keyboard_arrow_down, color: effectsBoxColor),
              pickerDialogStyle:
                  _PhoneAuthConstants._pickerDialogStyle(context),
              decoration: _PhoneAuthConstants.decoration(context,
                  hintText: _PhoneAuthConstants._phoneHint),
              onChanged: onChanged,
              onCountryChanged: onCountryChanged));

  static Widget _buttonWidget(BuildContext context,
          {VoidCallback? signButtonOnTap, bool? optSending}) =>
      AppViewWidgets.customInkWell(
          // onTap: signButtonOnTap != null ? signButtonOnTap : null,
          child: Padding(
              padding: EdgeInsets.only(top: defaultSize),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                _buttonTitle(optSending!),
                SizedBox(width: defaultSize),
                optSending ? _circleIndicator(context) : _buttonIcon
              ])));

  static Widget _buttonTitle(bool optSending) => AppViewWidgets.textMontserrat(
      optSending
          ? _PhoneAuthConstants._sendingCodeTitle
          : _PhoneAuthConstants._sendCodeTitle,
      color: effectsBoxColor.darken(_PhoneAuthConstants._darkenValue),
      fontWeight: FontWeight.w500);

  static Container get _buttonIcon => Container(
      width: _PhoneAuthConstants._buttonWidgetSize,
      height: _PhoneAuthConstants._buttonWidgetSize,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: _PhoneAuthConstants._effectBoxColor),
      child: Icon(Icons.arrow_forward, size: 24, color: effectsBoxColor));

  static Widget _circleIndicator(BuildContext context) => Center(
      child: AppViewWidgets.spinKitFadingCircle(context,
          size: _PhoneAuthConstants._spinKitSize));

  static Widget codeField(BuildContext context,
          {Function(String)? onCompleted,
          TextEditingController? controller,
          VoidCallback? resendCodeButtonOnTap,
          bool? optSending}) =>
      Column(children: [
        pinCodeField(context, onCompleted: onCompleted, controller: controller),
        _resendCodeButton(context,
            optSending: optSending,
            resendCodeButtonOnTap: resendCodeButtonOnTap)
      ]);

  static Widget pinCodeField(BuildContext context,
          {Function(String)? onCompleted, TextEditingController? controller}) =>
      PinCodeTextField(
          cursorHeight: _PhoneAuthConstants._cursorHeight,
          appContext: context,
          textStyle: fieldTextStyle,
          length: _PhoneAuthConstants._codeLength,
          obscureText: false,
          blinkWhenObscuring: true,
          autoDisposeControllers: false,
          animationType: AnimationType.fade,
          pinTheme: _PhoneAuthConstants._pinTheme(context),
          cursorColor: nero,
          animationDuration: _PhoneAuthConstants._pinAnimationDuration,
          enableActiveFill: false,
          controller: controller,
          keyboardType: TextInputType.number,
          onCompleted: onCompleted,
          onChanged: (value) {},
          beforeTextPaste: (text) {
            debugPrint("Allowing to paste $text");
            return true;
          });

  static Widget _resendCodeButton(BuildContext context,
          {VoidCallback? resendCodeButtonOnTap, bool? optSending}) =>
      AppViewWidgets.customInkWell(
          onTap: resendCodeButtonOnTap != null ? resendCodeButtonOnTap : null,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            AppViewWidgets.textMontserrat(_PhoneAuthConstants._resendCodeTitle,
                color: nero,
                //effectsBoxColor.darken(_PhoneAuthConstants._darkenValue),
                fontWeight: FontWeight.w500),
            SizedBox(width: defaultSize),
            optSending! ? _circleIndicator(context) : _buttonIcon
          ]));

  static TextStyle get fieldTextStyle =>
      GoogleFonts.montserrat(color: nero, fontWeight: FontWeight.w500);
}
