import 'package:new_weedus/export.dart';

mixin CreditCardFormFieldMixin on State<CreditCardFormField> {
  final double _formBoxHeight = 45;
  final double _fontSize = 16;
  final int _darkenMaxValue = 20;
  final int _darkenMinValue = 8;
  final double _fontHeight = 1.5;
  late String _cardNumber;
  late String _expiryDate;
  late String _cardHolderName;
  late String _cvvCode;
  bool _isCvvFocused = false;
  late Color _themeColor;
  late void Function(CreditCardModel) _onCreditCardModelChange;
  late CreditCardModel _creditCardModel;
  final String _cardNumberTitle = 'Card Number';
  final String _cardNumberHint = '**** **** **** ****';
  final String _holderNameTitle = 'Name on Card';
  final String _expirationDateTitle = 'Expiration Date';
  final String _expirationDateHint = 'MM/YYYY';
  final String _cvvCodeTitle = 'CVV';
  final String _cvvCodeHint = '***';

  final MaskedTextController _cardNumberController =
      MaskedTextController(mask: '0000 0000 0000 0000');
  final TextEditingController _expiryDateController =
      MaskedTextController(mask: '00/00');
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cvvCodeController =
      MaskedTextController(mask: '000');

  FocusNode _cvvFocusNode = FocusNode();
  FocusNode _expiryDateNode = FocusNode();
  FocusNode _cardHolderNode = FocusNode();

  @override
  void initState() {
    super.initState();
    createCreditCardModel();
    _cardNumberController.text = widget.cardNumber;
    _expiryDateController.text = widget.expiryDate;
    _cardHolderNameController.text = widget.cardHolderName;
    _cvvCodeController.text = widget.cvvCode;
    _onCreditCardModelChange = widget.onCreditCardModelChange;
    _cvvFocusNode.addListener(textFieldFocusDidChange);
  }

  @override
  void dispose() {
    _cardHolderNode.dispose();
    _cvvFocusNode.dispose();
    _expiryDateNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _themeColor = widget.themeColor;
    super.didChangeDependencies();
  }

  /// Credit Card
  void cardNumberOnChanged(String value) {
    setState(() {
      _cardNumber = _cardNumberController.text;
      _creditCardModel.cardNumber = _cardNumber;
      _onCreditCardModelChange(_creditCardModel);
    });
  }

  /// Card Number
  void onCardNumberEditingComplete() {
    FocusScope.of(context).requestFocus(_expiryDateNode);
  }

  /// Card Number
  cardNumberValidator(String? value) {
    if (value!.isEmpty || value.length < 16) {
      return widget.numberValidationMessage;
    }

    return null;
  }

  /// Card Number
  Iterable<String>? cardNumberAutofillHints() =>
      widget.disableCardNumberAutoFillHints
          ? null
          : const <String>[AutofillHints.creditCardNumber];

  /// Card Holder Name
  void cardHolderNameOnChanged(String value) {
    setState(() {
      _cardHolderName = _cardHolderNameController.text;
      _creditCardModel.cardHolderName = _cardHolderName;
      _onCreditCardModelChange(_creditCardModel);
    });
  }

  /// Card Holder Name
  List<TextInputFormatter>? holderNameInputFormatters = [
    FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
  ];

  /// Card Holder Name
  void holderNameOnEditingComplete() {
    FocusScope.of(context).unfocus();
    _onCreditCardModelChange(_creditCardModel);
    widget.onFormComplete?.call();
  }

  /// Expiry Date
  void expiryDateOnChanged(String value) {
    if (_expiryDateController.text.startsWith(RegExp('[2-9]'))) {
      _expiryDateController.text = '0' + _expiryDateController.text;
    }
    setState(() {
      _expiryDate = _expiryDateController.text;
      creditCardModel.expiryDate = expiryDate;
      onCreditCardModelChange(creditCardModel);
    });
  }

  /// Expiry Date

  void expiryDateOnEditingComplete() {
    FocusScope.of(context).requestFocus(cvvFocusNode);
  }

  /// Expiry Date
  expiryDateValidator(String? value) {
    if (value!.isEmpty) {
      return widget.dateValidationMessage;
    }
    final DateTime now = DateTime.now();
    final List<String> date = value.split(RegExp(r'/'));
    final int month = int.parse(date.first);
    final int year = int.parse('20${date.last}');
    final int lastDayOfMonth = month < 12
        ? DateTime(year, month + 1, 0).day
        : DateTime(year + 1, 1, 0).day;
    final DateTime cardDate =
        DateTime(year, month, lastDayOfMonth, 23, 59, 59, 999);

    if (cardDate.isBefore(now) || month > 12 || month == 0) {
      return widget.dateValidationMessage;
    }
    return null;
  }

  /// CVV
  void cvvIconOnTap() {
    setState(() {
      widget.obscureCvv = !widget.obscureCvv;
    });
  }

  /// CVV

  void cvvOnEditingComplete() {
    if (widget.isHolderNameVisible)
      FocusScope.of(context).requestFocus(_cardHolderNode);
    else {
      FocusScope.of(context).unfocus();
      _onCreditCardModelChange(_creditCardModel);
      widget.onFormComplete?.call();
    }
  }

  /// CVV
  void cvvOnChanged(String text) {
    setState(() {
      _cvvCode = text;
      _creditCardModel.cvvCode = _cvvCode;
      _onCreditCardModelChange(_creditCardModel);
    });
  }

  /// CVV
  cvvValidator(String? value) {
    if (value!.isEmpty || value.length < 3) {
      return widget.cvvValidationMessage;
    }
    return null;
  }

  ///       ///          ///

  void textFieldFocusDidChange() {
    _creditCardModel.isCvvFocused = _cvvFocusNode.hasFocus;
    _onCreditCardModelChange(_creditCardModel);
  }

  void createCreditCardModel() {
    _cardNumber = widget.cardNumber;
    _expiryDate = widget.expiryDate;
    _cardHolderName = widget.cardHolderName;
    _cvvCode = widget.cvvCode;
    _creditCardModel = CreditCardModel(
        _cardNumber, _expiryDate, _cardHolderName, _cvvCode, _isCvvFocused);
  }

  String get cardNumber => _cardNumber;

  String get expiryDate => _expiryDate;

  String get cardHolderName => _cardHolderName;

  String get cvvCode => _cvvCode;

  bool get isCvvFocused => _isCvvFocused;

  Color get themeColor => _themeColor;

  void Function(CreditCardModel) get onCreditCardModelChange =>
      _onCreditCardModelChange;

  CreditCardModel get creditCardModel => _creditCardModel;

  MaskedTextController get cardNumberController => _cardNumberController;

  TextEditingController get cardHolderNameController =>
      _cardHolderNameController;

  TextEditingController get expiryDateController => _expiryDateController;

  TextEditingController get cvvCodeController => _cvvCodeController;

  FocusNode get cvvFocusNode => _cvvFocusNode;

  FocusNode get expiryDateNode => _expiryDateNode;

  FocusNode get cardHolderNode => _cardHolderNode;

  double get fontSize => _fontSize;

  int get darkenMaxValue => _darkenMaxValue;

  int get darkenMinValue => _darkenMinValue;

  double get fontHeight => _fontHeight;

  double get formBoxHeight => _formBoxHeight;

  String get cardNumberTitle => _cardNumberTitle;

  String get cardNumberHint => _cardNumberHint;

  String get holderNameTitle => _holderNameTitle;

  String get expirationDateTitle => _expirationDateTitle;

  String get expirationDateHint => _expirationDateHint;

  String get cvvCodeTitle => _cvvCodeTitle;

  String get cvvCodeHint => _cvvCodeHint;
}
