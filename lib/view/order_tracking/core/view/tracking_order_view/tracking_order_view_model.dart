import 'package:new_weedus/export.dart';

class TrackingOrderViewModel {
  DateTime now = DateTime.now();
  String? _formattedDate;
  List<TextAndDateTimeModel>? _orderList;
  final String _placedTitle = 'Your order has been placed';
  final String _summeryTitle = 'Summary';
  final String _userTitle = 'Example User';
  final String _orderIDTitle = 'Order ID';
  final String _orderNumber = '334902461';
  final String _orderDateTitle = 'Order Date';
  final String _phoneTitle = 'Phone';
  final String _phoneNumber = '(810) 810-1010';
  final String _deliveryTitle = 'Delivery';
  final _address = '935 Grattan St #27, Los Angeles, CA 90015';
  final String _totalTitle = 'Total';

  final double _summerFontSize = 20;
  final double _titleFontSize = 18;
  final double _fontSize = 14;
  final double _titleWidth = 100;
  final double _valueWidth = 250;

  void formatAndSetOrderList() {
    _formattedDate = DateFormat('MMM d, HH:mm').format(now);
    _orderList = [
      TextAndDateTimeModel('Your order has been placed', '$_formattedDate'),
      TextAndDateTimeModel('', '')
    ];
  }

  String? get formattedDate => _formattedDate;

  String get placedTitle => _placedTitle;

  String get summeryTitle => _summeryTitle;

  String get userTitle => _userTitle;

  String get orderIDTitle => _orderIDTitle;

  String get orderNumber => _orderNumber;

  String get orderDateTitle => _orderDateTitle;

  String get phoneTitle => _phoneTitle;

  String get phoneNumber => _phoneNumber;

  String get deliveryTitle => _deliveryTitle;

  String get address => _address;

  String get totalTitle => _totalTitle;

  double get titleWidth => _titleWidth;

  double get valueWidth => _valueWidth;

  double get summerFontSize => _summerFontSize;

  double get titleFontSize => _titleFontSize;

  double get fontSize => _fontSize;

  List<TextAndDateTimeModel>? get orderList => _orderList;
}
