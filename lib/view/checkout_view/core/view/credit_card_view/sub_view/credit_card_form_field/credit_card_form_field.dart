import 'package:new_weedus/export.dart';

// ignore: must_be_immutable
class CreditCardFormField extends StatefulWidget {
  CreditCardFormField({
    Key? key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    this.obscureCvv = false,
    this.obscureNumber = false,
    required this.onCreditCardModelChange,
    required this.themeColor,
    this.textColor = Colors.black,
    this.cursorColor,
    required this.formKey,
    this.cardNumberKey,
    this.cardHolderKey,
    this.expiryDateKey,
    this.cvvCodeKey,
    this.cvvValidationMessage = 'Please input a valid CVV',
    this.dateValidationMessage = 'Please input a valid date',
    this.numberValidationMessage = 'Please input a valid number',
    this.isHolderNameVisible = true,
    this.isCardNumberVisible = true,
    this.isExpiryDateVisible = true,
    this.enableCvv = true,
    this.autoValidateMode,
    this.cardNumberValidator,
    this.expiryDateValidator,
    this.cvvValidator,
    this.cardHolderValidator,
    this.onFormComplete,
    this.disableCardNumberAutoFillHints = false,
  }) : super(key: key);

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final String cvvValidationMessage;
  final String dateValidationMessage;
  final String numberValidationMessage;
  final void Function(CreditCardModel) onCreditCardModelChange;
  final Color themeColor;
  final Color textColor;
  final Color? cursorColor;
  bool obscureCvv;
  bool obscureNumber;
  final bool isHolderNameVisible;
  final bool isCardNumberVisible;
  final bool enableCvv;
  final bool isExpiryDateVisible;
  final GlobalKey<FormState> formKey;
  final Function? onFormComplete;
  final GlobalKey<FormFieldState<String>>? cardNumberKey;
  final GlobalKey<FormFieldState<String>>? cardHolderKey;
  final GlobalKey<FormFieldState<String>>? expiryDateKey;
  final GlobalKey<FormFieldState<String>>? cvvCodeKey;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String?)? cardNumberValidator;
  final String? Function(String?)? expiryDateValidator;
  final String? Function(String?)? cvvValidator;
  final String? Function(String?)? cardHolderValidator;
  final bool disableCardNumberAutoFillHints;

  @override
  State<CreditCardFormField> createState() => _CreditCardFormFieldState();
}

class _CreditCardFormFieldState extends State<CreditCardFormField>
    with CreditCardFormFieldMixin {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            primaryColor: themeColor.withOpacity(0.8),
            primaryColorDark: themeColor),
        child: Form(
            key: widget.formKey,
            child: Column(children: [
              Row(children: [
                _cardNumberField,
                _widthSizedBox,
                _cardHolderNameField
              ]),
              _heightSizedBox,
              Row(children: [
                _expirationDateField,
                _widthSizedBox,
                _cvvField,
              ]),
              _heightSizedBox,
            ])));
  }

  Widget get _cardNumberField =>
      CreditCardFormFieldWidgets.cardNumberFieldWidget(
          visible: widget.isCardNumberVisible,
          child: TextFormField(
              key: widget.cardNumberKey,
              obscureText: widget.obscureNumber,
              controller: cardNumberController,
              onChanged: (String value) => cardNumberOnChanged(value),
              cursorColor: widget.cursorColor ?? themeColor,
              onEditingComplete: () => onCardNumberEditingComplete(),
              style: CreditCardFormFieldWidgets.textStyle(
                  color: nero),
              decoration: CreditCardFormFieldWidgets.decoration(
                  labelText: cardNumberTitle, hintText: cardNumberHint),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              autofillHints: cardNumberAutofillHints(),
              autovalidateMode: widget.autoValidateMode,
              validator: widget.cardNumberValidator ??
                  (String? value) => cardNumberValidator(value)));

  SizedBox get _widthSizedBox => SizedBox(width: defaultSize);

  SizedBox get _heightSizedBox => SizedBox(height: defaultSize);

  Widget get _cardHolderNameField => CreditCardFormFieldWidgets.cardFieldWidget(
      visible: widget.isHolderNameVisible,
      child: TextFormField(
          keyboardType: TextInputType.name,
          inputFormatters: holderNameInputFormatters,
          key: widget.cardHolderKey,
          controller: cardHolderNameController,
          onChanged: (String value) => cardHolderNameOnChanged(value),
          cursorColor: widget.cursorColor ?? themeColor,
          focusNode: cardHolderNode,
          style:
              CreditCardFormFieldWidgets.textStyle(color: nero),
          decoration:
              CreditCardFormFieldWidgets.decoration(labelText: holderNameTitle),
          textInputAction: TextInputAction.done,
          autofillHints: const <String>[AutofillHints.creditCardName],
          onEditingComplete: () => holderNameOnEditingComplete(),
          validator: widget.cardHolderValidator));

  Widget get _expirationDateField => CreditCardFormFieldWidgets.cardFieldWidget(
      visible: widget.enableCvv,
      child: TextFormField(
          key: widget.expiryDateKey,
          controller: expiryDateController,
          onChanged: (String value) => expiryDateOnChanged(value),
          cursorColor: widget.cursorColor ?? themeColor,
          focusNode: expiryDateNode,
          onEditingComplete: () => expiryDateOnEditingComplete(),
          style:
              CreditCardFormFieldWidgets.textStyle(color: nero),
          decoration: CreditCardFormFieldWidgets.decoration(
              labelText: expirationDateTitle, hintText: expirationDateHint),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          autofillHints: const <String>[AutofillHints.creditCardExpirationDate],
          validator: widget.expiryDateValidator ??
              (String? value) => expiryDateValidator(value)));

  Widget get _cvvField => CreditCardFormFieldWidgets.cardFieldWidget(
      visible: widget.enableCvv,
      child: TextFormField(
          key: widget.cvvCodeKey,
          obscureText: widget.obscureCvv,
          focusNode: cvvFocusNode,
          controller: cvvCodeController,
          cursorColor: widget.cursorColor ?? themeColor,
          onEditingComplete: () => cvvOnEditingComplete(),
          style:
              CreditCardFormFieldWidgets.textStyle(color: nero),
          decoration: _cvvDecoration,
          keyboardType: TextInputType.number,
          textInputAction: widget.isHolderNameVisible
              ? TextInputAction.next
              : TextInputAction.done,
          autofillHints: const <String>[AutofillHints.creditCardSecurityCode],
          onChanged: (String text) => cvvOnChanged(text),
          validator:
              widget.cvvValidator ?? (String? value) => cvvValidator(value)));

  InputDecoration get _cvvDecoration => CreditCardFormFieldWidgets.decoration(
      labelText: cvvCodeTitle,
      hintText: cvvCodeHint,
      suffixIconColor: widget.obscureCvv
          ? effectsBoxColor.darken(darkenMaxValue)
          : nero,
      suffixIcon: AppViewWidgets.customInkWell(
          onTap: () => cvvIconOnTap(),
          child: Icon(
              widget.obscureCvv ? Icons.visibility_off : Icons.visibility)));
}
