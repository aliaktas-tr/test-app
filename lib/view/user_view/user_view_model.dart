import 'package:new_weedus/export.dart';

class UserViewModel extends ChangeNotifier {
  int _settingIndex = 0;
  int get settingIndex => _settingIndex;

  void setSettingIndex(int index) {
    _settingIndex = index;
    print('index: $_settingIndex');
    notifyListeners();
  }


  bool _isProfileEdit = false;
  bool _isMmjEdit = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _mmjIDController = TextEditingController();
  TextEditingController _mmjIssuedController = TextEditingController();
  TextEditingController _mmjExpiresController = TextEditingController();
  TextEditingController _mmjNameController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool get isProfileEdit => _isProfileEdit;

  bool get isMmjEdit => _isMmjEdit;

  TextEditingController get nameController => _nameController;

  TextEditingController get phoneNumberController => _phoneNumberController;

  TextEditingController get addressController => _addressController;

  TextEditingController get mmjIDController => _mmjIDController;

  TextEditingController get mmjIssuedController => _mmjIssuedController;

  TextEditingController get mmjExpiresController => _mmjExpiresController;

  TextEditingController get mmjNameController => _mmjNameController;

  GlobalKey<FormState> get formKey => _formKey;

  set setProfileEdit(bool value) {
    _isProfileEdit = value;
    notifyListeners();
  }

  set setMmjEdit(bool value) {
    _isMmjEdit = value;
    notifyListeners();
  }
}
