import 'package:new_weedus/export.dart';

class _TextFormWidgets {
  static final double _halfWidthBorderValue = 0.5;
  static final double _borderWidthValue = 1.0;
  static final double _sizeValue = 15;
  static final double _suffixIconSize = 18;
  static final int _darkenValue = 20;
  static final double _zeroValue = 0.0;
  static final Color _color = nero;
  static final double _minWidth = 30;
  static final double _maxHeight = 25;
  static final BoxConstraints _prefixIconConstraints =
      BoxConstraints(minWidth: _minWidth, maxHeight: _maxHeight);

  static TextStyle get textFieldTextStyle => GoogleFonts.montserrat(
      fontSize: 16, color: nero, fontWeight: FontWeight.w500);

  static UnderlineInputBorder get _border => UnderlineInputBorder(
      borderSide: BorderSide(color: _color, width: _halfWidthBorderValue));

  static UnderlineInputBorder get _focusBorder => UnderlineInputBorder(
      borderSide: BorderSide(color: effectsBoxColor, width: _borderWidthValue));

  static Widget _prefixIcon(BuildContext context, {IconData? prefix}) =>
      Icon(prefix, size: _sizeValue, color: nero);

  static Widget _suffixIcon(BuildContext context, {IconData? suffix}) =>
      Icon(suffix, size: _suffixIconSize, color: nero);

  static TextStyle _textFieldHintStyle =
      GoogleFonts.montserrat(color: effectsBoxColor.darken(_darkenValue));

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
          contentPadding: EdgeInsets.zero,
          enabledBorder: _border,
          focusedBorder: _border,
          border: _border,
          errorStyle: TextStyle(height: _zeroValue, fontSize: _zeroValue));
}

class TextFormBuilder extends StatefulWidget {
  final String? initialValue;
  final bool? enabled;
  final String? hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final bool obscureText;
  final FocusNode? focusNode, nextFocusNode;
  final VoidCallback? submitAction;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String)? onSaved, onChange;
  final Key? key;
  final IconData? prefix;
  final IconData? suffix;

  TextFormBuilder(
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
      this.key,
      this.textCapitalization});

  @override
  _TextFormBuilderState createState() => _TextFormBuilderState();
}

class _TextFormBuilderState extends State<TextFormBuilder>
    with TextFormBuilderMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_formField, _errorWidget]);
  }

  Widget get _formField => TextFormField(
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: nero,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      initialValue: widget.initialValue,
      enabled: widget.enabled,
      //onChanged: (val) => onChanged(val),
      style: _TextFormWidgets.textFieldTextStyle,
      key: widget.key,
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.textInputType,
      validator: widget.validateFunction,
      onSaved: (val) => onSaved(val),
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      onFieldSubmitted: (String term) => onFieldSubmitted(term),
      decoration: _decoration);

  InputDecoration get _decoration => _TextFormWidgets.decoration(context,
      hintText: widget.hintText, prefix: widget.prefix, suffix: widget.suffix);

  Widget get _errorWidget => FormErrorVisibility(error: error);
}

///       ///        ///      _ResetPassTextFormWidgets

class _ResetPassTextFormWidgets {
  static final double _containerHeight = 30;
  static final double _halfWidthBorderValue = 0.5;
  static final double _borderWidthValue = 1.0;
  static final double _sizeValue = 15;
  static final double _suffixIconSize = 18;
  static final int _darkenValue = 20;
  static final double _zeroValue = 0.0;
  static final double _opacityValue = 0.6;
  static final Color _color = nero;
  static final double _minWidth = 30;
  static final double _maxHeight = 25;
  static final BoxConstraints _prefixIconConstraints =
      BoxConstraints(minWidth: _minWidth, maxHeight: _maxHeight);

  static Widget formContainer(BuildContext context, {Widget? child}) =>
      Container(
          height: _containerHeight,
          child: Theme(
              data: ThemeData(
                  primaryColor: Theme.of(context).colorScheme.secondary,
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                      secondary: Theme.of(context).colorScheme.secondary)),
              child: child!));

  static TextStyle get textFieldTextStyle => GoogleFonts.montserrat(
      fontSize: 16, color: nero, fontWeight: FontWeight.w500);

  static UnderlineInputBorder get _border => UnderlineInputBorder(
      borderSide: BorderSide(color: _color, width: _halfWidthBorderValue));

  static UnderlineInputBorder get _focusBorder => UnderlineInputBorder(
      borderSide: BorderSide(color: effectsBoxColor, width: _borderWidthValue));

  static Widget _prefixIcon(BuildContext context, {IconData? prefix}) =>
      Icon(prefix, size: _sizeValue, color: nero);

  static Widget _suffixIcon(BuildContext context, {IconData? suffix}) =>
      Icon(suffix, size: _suffixIconSize, color: nero);

  static TextStyle _textFieldHintStyle = GoogleFonts.montserrat(
      fontSize: 16, color: effectsBoxColor.darken(_darkenValue));

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
          contentPadding: EdgeInsets.zero,
          enabledBorder: _border,
          focusedBorder: _border,
          border: _border,
          errorStyle: TextStyle(height: _zeroValue, fontSize: _zeroValue));
}

class ResetPassTextFormBuilder extends StatefulWidget {
  final String? initialValue;
  final bool? enabled;
  final String? hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final FocusNode? focusNode, nextFocusNode;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String)? onSaved, onChange;
  final Key? key;
  final IconData? prefix;
  final IconData? suffix;

  ResetPassTextFormBuilder(
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
      this.obscureText = false,
      this.validateFunction,
      this.onSaved,
      this.onChange,
      this.key});

  @override
  _ResetPassTextFormBuilderState createState() =>
      _ResetPassTextFormBuilderState();
}

class _ResetPassTextFormBuilderState extends State<ResetPassTextFormBuilder>
    with ResetPassTextFormBuilderMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_formContainer, _errorWidget]);
  }

  Widget get _formContainer =>
      _ResetPassTextFormWidgets.formContainer(context, child: _formField);

  Widget get _formField => TextFormField(
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: effectsBoxColor,
      textCapitalization: TextCapitalization.none,
      initialValue: widget.initialValue,
      enabled: widget.enabled,
      onChanged: (val) => onChanged(val),
      style: _ResetPassTextFormWidgets.textFieldTextStyle,
      key: widget.key,
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.textInputType,
      validator: widget.validateFunction,
      onSaved: (val) => onSaved(val),
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      onFieldSubmitted: (String term) => onFieldSubmitted(term),
      decoration: _decoration);

  InputDecoration get _decoration =>
      _ResetPassTextFormWidgets.decoration(context,
          hintText: widget.hintText,
          prefix: widget.prefix,
          suffix: widget.suffix);

  Widget get _errorWidget =>
      FormErrorVisibility(error: error, color: errorColor);
}
