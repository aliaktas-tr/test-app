import 'package:new_weedus/export.dart';

class _PasswordFormWidgets {
  static final double _halfWidthBorderValue = 0.5;
  static final double _sizeValue = 15;
  static final double _suffixIconSize = 18;
  static final int _darkenValue = 20;
  static final double _zeroValue = 0.0;
  static final Color _color = nero;

  static final double _minWidth = 30;
  static final double _maxHeight = 25;
  static final BoxConstraints _prefixIconConstraints =
      BoxConstraints(minWidth: _minWidth, maxHeight: _maxHeight);

  static TextStyle get textFieldTextStyle =>
      GoogleFonts.montserrat(color: nero, fontWeight: FontWeight.w500);

  static TextStyle get _textFieldHintStyle =>
      GoogleFonts.montserrat(color: effectsBoxColor.darken(_darkenValue));

  static UnderlineInputBorder get _border => UnderlineInputBorder(
      borderSide: BorderSide(color: _color, width: _halfWidthBorderValue));

  static Widget _prefixIcon(BuildContext context, {IconData? prefix}) =>
      Icon(prefix, size: _sizeValue, color: nero);

  static Widget _suffixIcon(BuildContext context, bool obscureText,
          {VoidCallback? suffixOnTap, IconData? suffix}) =>
      GestureDetector(
          onTap: suffixOnTap,
          child: Padding(
            padding: EdgeInsets.only(left: defaultSize),
            child: Icon(obscureText ? suffix : Ionicons.eye_off_outline,
                size: _suffixIconSize, color: nero),
          ));

  static InputDecoration decoration(BuildContext context,
          {bool? obscureText,
          IconData? prefix,
          String? hintText,
          VoidCallback? suffixOnTap,
          IconData? suffix}) =>
      InputDecoration(
          prefixIcon: _prefixIcon(context, prefix: prefix),
          suffixIcon: _suffixIcon(context, obscureText!,
              suffixOnTap: suffixOnTap, suffix: suffix),
          prefixIconConstraints: _prefixIconConstraints,
          filled: false,
          isDense: true,
          contentPadding: EdgeInsets.zero,
          hintText: hintText,
          hintStyle: _textFieldHintStyle,
          border: _border,
          enabledBorder: _border,
          focusedBorder: _border,
          errorStyle: TextStyle(height: _zeroValue, fontSize: _zeroValue));
}

class PasswordFormBuilder extends StatefulWidget {
  final String? initialValue;
  final bool? enabled;
  final String? hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode, nextFocusNode;
  final VoidCallback? submitAction;
  final bool obscureText;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String)? onSaved, onChange;
  final Key? key;
  final IconData? prefix;
  final IconData? suffix;

  PasswordFormBuilder(
      {this.prefix,
      this.suffix,
      this.initialValue,
      this.enabled,
      this.hintText,
      this.textInputType,
      this.controller,
      this.textInputAction,
      this.nextFocusNode,
      this.focusNode,
      this.submitAction,
      this.obscureText = false,
      this.validateFunction,
      this.onSaved,
      this.onChange,
      this.key});

  @override
  _PasswordFormBuilderState createState() => _PasswordFormBuilderState();
}

class _PasswordFormBuilderState extends State<PasswordFormBuilder>
    with PasswordFormBuilderMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_formField, _errorChild]);
  }

  Widget get _formField => TextFormField(
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: nero,
      initialValue: widget.initialValue,
      enabled: widget.enabled,
      //onChanged: (val) => onChanged(val),
      style: _PasswordFormWidgets.textFieldTextStyle,
      key: widget.key,
      controller: widget.controller,
      obscureText: obscureText,
      keyboardType: widget.textInputType,
      validator: widget.validateFunction,
      onSaved: (val) => onSaved(val),

      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      onFieldSubmitted: (String term) => onFieldSubmitted(term),
      decoration: _decoration);

  InputDecoration get _decoration => _PasswordFormWidgets.decoration(context,
      hintText: widget.hintText,
      obscureText: obscureText,
      prefix: widget.prefix,
      suffix: widget.suffix,
      suffixOnTap: () => suffixOnTap());

  Widget get _errorChild => FormErrorVisibility(error: error);
}
