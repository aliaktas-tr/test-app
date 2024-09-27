import 'package:new_weedus/export.dart';

class CreditCardView extends StatefulWidget {
  const CreditCardView({super.key, this.onTap, this.makingPayment});

  final VoidCallback? onTap;
  final bool? makingPayment;

  @override
  State<CreditCardView> createState() => _CreditCardViewState();
}

class _CreditCardViewState extends State<CreditCardView>
    with CreditCardViewMixin {
  @override
  Widget build(BuildContext context) {
    final _cart = context.watch<CartState>();
    return SizedBox(
        width: cardFieldSize,
        child: Column(
          children: <Widget>[
            _checkboxAndAddressField,
            _animatedAddressForm,
            _doubleHeightSizedBox,
            _creditCardField(_cart),
          ],
        ));
  }

  Widget get _checkboxAndAddressField => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_headerRow, _halfHeightSizedBox, _addressField],
      );

  Widget get _headerRow => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_billingHeaderTitle, _sameAsCheckBox]);

  Widget get _billingHeaderTitle =>
      AppViewWidgets.textMontserrat(AppStrings.billingAddress!,
          fontSize: titleFontSize, color: nero, fontWeight: FontWeight.w600);

  Widget get _sameAsCheckBox => CreditCartViewWidgets.sameAsCheckBox(
      checkboxValue: checkboxValue,
      onChanged: (val) => onChanged(val!),
      onChange: (val) => onChange(val!));

  Widget get _addressField => CreditCartViewWidgets.formField(
      formKey: formKey2,
      textEditingController: streetController,
      textEditingController2: buildingEtcController,
      validator: streetController.text.isEmpty ? validateStreet : null,
      validator2:
          buildingEtcController.text.isEmpty ? validateBuildingEtc : null);

  Widget get _doubleHeightSizedBox => SizedBox(height: doubleDefaultSize);

  Widget get _halfHeightSizedBox => SizedBox(height: halfDefaultSize);

  Widget _creditCardField(CartState _cart) => Column(
        children: [
          _cardType,
          _halfHeightSizedBox,
          _creditCardForm,
          _cart.itemCount < 1 ? _sizedBoxShrink : _paymentButton
        ],
      );

  Widget get _sizedBoxShrink => SizedBox.shrink();

  Widget get _animatedAddressForm =>
      CreditCartViewWidgets.animatedAddressForm(checkboxValue: checkboxValue);

  Widget get _cardType => CreditCartViewWidgets.paymentHeaderAndCardType();

  Widget get _creditCardForm => CreditCartViewWidgets.creditCardForm(
      onCreditCardModelChange: (cardModel) =>
          onCreditCardModelChange(cardModel));

  Widget get _paymentButton => widget.makingPayment!
      ? SizedBox.shrink()
      : Align(
          alignment: Alignment.bottomRight,
          child: CustomTextButton(
              buttonTitle: AppStrings.validateButtonTitle!,
              overlayColor: WidgetStateProperty.all(appColor),
              padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: halfDefaultSize)),
              hoveredColor: nero,
              onTap: widget.onTap),
        );
}
