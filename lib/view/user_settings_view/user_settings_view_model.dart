import 'package:new_weedus/export.dart';

class UserSettingsViewModel extends ChangeNotifier {
  static List<String> _text = [
    'Receive order status updates via text message',
    'Receive important email updates about weedus',
    'Receive email updates about discounts and offers',
    'Receive email updates about new products'
  ];

  Future<void> onValueChange(List<bool> value) async {
    isChecked = value;
    notifyListeners();
  }

  static List<bool> isChecked = List<bool>.filled(_text.length, false);
}
