import 'package:new_weedus/export.dart';

class CreditCardFormFieldWidgets {
  static final double _fontSize = 16;
  static final int _darkenMaxValue = 20;
  static final double _fontHeight = 1.5;
  static final double _formBoxHeight = 47;

  static TextStyle textStyle(
          {Color? color,
          FontWeight? fontWeight,
          int? darkenValue,
          double? fontHeight,
          double? letterSpacing}) =>
      GoogleFonts.montserrat(
          fontSize: _fontSize,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ??
              effectsBoxColor
                  .darken(darkenValue ?? _darkenMaxValue),
          height: fontHeight,
          letterSpacing: letterSpacing);

  static InputDecoration decoration(
          {String? hintText,
          String? labelText,
          Color? suffixIconColor,
          Widget? suffixIcon}) =>
      InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          hintText: hintText,
          labelStyle: textStyle(fontHeight: _fontHeight),
          hintStyle: textStyle(
              color: nero,
              fontWeight: FontWeight.w400,
              fontHeight: _fontHeight,
              letterSpacing: _fontHeight),
          suffixIconColor: suffixIconColor,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.only(left: defaultSize));

  static BoxDecoration cardBoxDecoration() => BoxDecoration(
      border: Border.all(
          color: effectsBoxColor.darken(_darkenMaxValue)),
      /*borderRadius: BorderRadius.circular(quarterDefaultSize)*/);

  static Widget cardNumberFieldWidget({bool? visible, Widget? child}) =>
      Expanded(
          child: IntrinsicWidth(
              child: Visibility(
                  visible: visible!,
                  child: Container(
                      height: _formBoxHeight,
                      decoration: cardBoxDecoration(),
                      child: child))));

  static Widget cardFieldWidget({bool? visible, Widget? child}) => Expanded(
      child: Visibility(
          visible: visible!,
          child: Container(
              height: _formBoxHeight,
              decoration: cardBoxDecoration(),
              child: child)));
}
