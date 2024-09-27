import 'package:new_weedus/export.dart';

class CreditCartViewWidgets {
  static String _cardNumber = '4242 4242 4242 4242';
  static String _expiryDate = '1026';
  static String _cardHolderName = 'Example User';
  static String _cvvCode = '123';
  static String _addressFieldLabel = 'Street Address or P.O Box';
  static String _buildingFieldLabel = 'Apt, Suit, Unit, Building, Floor, etc.';
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final TextEditingController _streetController =
      TextEditingController(text: '935 Grattan St');
  static final TextEditingController _buildingEtcController =
      TextEditingController(text: '# 27 Academy House');
  static final GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();
  static final double _titleFontSize = 20;
  static final double _checkBoxSize = 20;
  static final double _checkBoxFontSize = 13;
  static final int _animationDuration = 250;
  static final double _animatedContainerHeight = 184;
  static final int _darkenValue = 20;

  static Widget paymentHeaderAndCardType() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppViewWidgets.textMontserrat(AppStrings.payment!,
              fontSize: _titleFontSize,
              color: nero,
              fontWeight: FontWeight.w600),
          CreditCardTypeView(cardNumber: _cardNumber, obscureCardNumber: true)
        ],
      );

  static Widget formField(
          {GlobalKey<FormState>? formKey,
          TextEditingController? textEditingController,
          TextEditingController? textEditingController2,
          String? Function(String?)? validator,
          String? Function(String?)? validator2}) =>
      Form(
          key: formKey,
          child: Column(children: [
            CustomFormField(
                labelText: _addressFieldLabel,
                textEditingController: textEditingController,
                validator: validator),
            SizedBox(height: defaultSize),
            CustomFormField(
                labelText: _buildingFieldLabel,
                textEditingController: textEditingController2,
                validator: validator2)
          ]));

  static Widget animatedAddressForm({bool? checkboxValue}) => AnimatedContainer(
      duration: Duration(milliseconds: _animationDuration),
      height: checkboxValue! ? 0.0 : _animatedContainerHeight,
      child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            SizedBox(height: doubleDefaultSize),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppViewWidgets.textMontserrat(AppStrings.deliveryAddress!,
                  fontSize: _titleFontSize,
                  color: nero,
                  fontWeight: FontWeight.w600),
              SizedBox(height: halfDefaultSize),
              formField(
                  formKey: _formKey3,
                  textEditingController: _streetController,
                  textEditingController2: _buildingEtcController,
                  validator: validateStreet,
                  validator2: validateBuildingEtc)
            ])
          ]));

  static Widget sameAsCheckBox(
          {bool? checkboxValue,
          void Function(bool?)? onChanged,
          void Function(bool?)? onChange}) =>
      Row(children: [
        AppViewWidgets.textMontserrat(AppStrings.billingAddressSameAs!,
            fontSize: _checkBoxFontSize,
            fontWeight: FontWeight.normal,
            color: effectsBoxColor.darken(_darkenValue)),
        SizedBox(
            height: _checkBoxSize,
            child: CustomCheckBoxView(
               //useWithoutTransform: true,
                activeColor: appColor,
                value: checkboxValue,
                text: '',
                onChanged: onChanged,
                //onChange: onChange,
            ))
      ]);

  static Widget creditCardForm(
          {void Function(CreditCardModel)? onCreditCardModelChange}) =>
      CreditCardFormField(
          formKey: _formKey,
          obscureCvv: true,
          obscureNumber: false,
          cardNumber: _cardNumber,
          cvvCode: _cvvCode,
          isHolderNameVisible: true,
          isCardNumberVisible: true,
          isExpiryDateVisible: true,
          cardHolderName: _cardHolderName,
          expiryDate: _expiryDate,
          themeColor: Colors.blue,
          textColor: effectsBoxColor.darken(_darkenValue),
          onCreditCardModelChange: onCreditCardModelChange!);
}
