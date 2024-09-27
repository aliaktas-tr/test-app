import 'package:new_weedus/export.dart';

mixin CreditCardViewMixin on State<CreditCardView> {
  String _cardNumber = '4242 4242 4242 4242';
  String _expiryDate = '1025';
  String _cardHolderName = 'Example User';
  String _cvvCode = '123';
  String _addressFieldLabel = 'Street Address or P.O Box';
  String _buildingFieldLabel = 'Apt, Suit, Unit, Building, Floor, etc.';
  bool _isCvvFocused = false;
  bool _useGlassMorphism = false;
  bool _useBackgroundImage = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _streetController =
      TextEditingController(text: '935 Grattan St');
  final TextEditingController _buildingEtcController =
      TextEditingController(text: '# 27 Academy House');
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();
  bool _checkboxValue = true;
  bool _makingPayment = false;
  bool _completeOrder = false;
  final String _id = '1234567';
  final double _cardFieldSize = 550;
  final double _titleFontSize = 20;
  final double _checkBoxSize = 20;
  final double _checkBoxFontSize = 13;
  final int _animationDuration = 250;
  final double _animatedContainerHeight = 184;
  final double _spinKitSize = 45;
  final double _iconSize = 30;
  final int _darkenValue = 20;

  void onChanged(bool value) {
    setState(() {
      _checkboxValue = value;
    });
  }

  void onChange(bool value) {
    setState(() {
      _checkboxValue = value;
    });
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      _cardNumber = creditCardModel!.cardNumber;
      _expiryDate = creditCardModel.expiryDate;
      _cardHolderName = creditCardModel.cardHolderName;
      _cvvCode = creditCardModel.cvvCode;
      _isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  String get cardNumber => _cardNumber;

  String get expiryDate => _expiryDate;

  String get cardHolderName => _cardHolderName;

  String get cvvCode => _cvvCode;

  String get addressFieldLabel => _addressFieldLabel;

  String get buildingFieldLabel => _buildingFieldLabel;

  bool get isCvvFocused => _isCvvFocused;

  bool get useGlassMorphism => _useGlassMorphism;

  bool get useBackgroundImage => _useBackgroundImage;

  bool get checkboxValue => _checkboxValue;

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get streetController => _streetController;

  TextEditingController get buildingEtcController => _buildingEtcController;

  GlobalKey<FormState> get formKey2 => _formKey2;

  GlobalKey<FormState> get formKey3 => _formKey3;

  bool get makingPayment => _makingPayment;

  bool get completeOrder => _completeOrder;

  String get id => _id;

  double get cardFieldSize => _cardFieldSize;

  double get titleFontSize => _titleFontSize;

  int get animationDuration => _animationDuration;

  double get animatedContainerHeight => _animatedContainerHeight;

  double get spinKitSize => _spinKitSize;

  double get iconSize => _iconSize;

  double get checkBoxSize => _checkBoxSize;

  double get checkBoxFontSize => _checkBoxFontSize;

  int get darkenValue => _darkenValue;
}
