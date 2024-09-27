import 'package:new_weedus/export.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {super.key,
      this.labelText,
      this.hintText,
      this.errorText,
      this.textEditingController,
      this.inputFormatters,
      this.validator,
      this.formFieldKey,
      this.addRightLine = false,
      this.addBottomLine = false,
      this.addDecoration = true,
      this.enabled = false});

  final String? labelText;
  final String? hintText;
  final String? errorText;
  final bool? addRightLine;
  final bool? addBottomLine;
  final bool? addDecoration;
  final bool? enabled;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final GlobalKey<FormFieldState<String>>? formFieldKey;

  final BoxDecoration _boxDecoration = BoxDecoration(
      border: Border.all(color: effectsBoxColor.darken(20)),
     // borderRadius: BorderRadius.circular(quarterDefaultSize)
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: addDecoration! ? _boxDecoration : null,
        child: _CheckoutFieldWidget(
            formFieldKey: formFieldKey,
            textEditingController: textEditingController!,
            labelText: labelText,
            hintText: hintText,
            enabled: enabled,
            addRightLine: addRightLine,
            addBottomLine: addBottomLine,
            inputFormatters: inputFormatters,
            validator: validator,
            errorText: errorText));
  }
}

class _CheckoutFieldWidget extends StatelessWidget {
  _CheckoutFieldWidget(
      {Key? key,
      required this.textEditingController,
      this.keyboardType,
      this.autoValidateMode,
      this.validator,
      this.labelText,
      this.addBottomLine = false,
      this.addRightLine = false,
      this.hintText,
      this.inputFormatters,
      this.prefix,
      this.prefixIcon,
      this.suffix,
      this.suffixIcon,
      this.onChanged,
      this.formFieldKey,
      this.hasError = false,
      this.errorText,
      this.enabled = false})
      : super(key: key);
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final bool? addBottomLine;
  final bool? addRightLine;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;

  final void Function(String)? onChanged;
  final GlobalKey<FormFieldState<String>>? formFieldKey;
  final bool? hasError;
  final bool? enabled;

  final double _formHeight = 45;
  final double _fontSize = 16.0;
  final double _spacing = 1.5;
  final int _labelDarkenValue = 20;
  final int _hintDarkenValue = 8;

  final Border _bottomBorder =
      Border(bottom: BorderSide(width: 0.6, color: Colors.grey.shade400));
  final Border _rightBorder =
      Border(bottom: BorderSide(width: 0.6, color: Colors.grey.shade400));

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _formHeight,
        decoration: BoxDecoration(
            border: addBottomLine!
                ? _bottomBorder
                : addRightLine!
                    ? _rightBorder
                    : null),
        child: _form());
  }

  Widget _form() {
    return TextFormField(
      enabled: enabled,
      key: formFieldKey,
      controller: textEditingController,
      onChanged: onChanged,
      cursorColor: effectsTextColor,
      onEditingComplete: () {},
      style: _style(),
      decoration: _decoration,
      textInputAction: TextInputAction.next,
      inputFormatters: inputFormatters,
      autovalidateMode: autoValidateMode,
      validator: validator,
    );
  }

  InputDecoration get _decoration => InputDecoration(
      border: InputBorder.none,
      labelText: labelText,
      labelStyle: _style(
          fontWeight: FontWeight.normal,
          color: effectsBoxColor.darken(_labelDarkenValue),
          height: _spacing),
      hintText: hintText,
      hintStyle: _style(
          fontWeight: FontWeight.w400,
          color: effectsBoxColor.darken(_hintDarkenValue),
          height: _spacing,
          letterSpacing: _spacing),
      prefix: prefix,
      prefixIcon: prefixIcon,
      suffix: suffix,
      suffixIcon: suffixIcon,
      contentPadding: EdgeInsets.only(left: defaultSize));

  TextStyle _style(
          {double? height,
          double? letterSpacing,
          FontWeight? fontWeight,
          Color? color}) =>
      GoogleFonts.montserrat(
          fontSize: _fontSize,
          fontWeight: fontWeight ?? FontWeight.normal,
          height: height,
          letterSpacing: letterSpacing,
          color: color ?? nero);
}
