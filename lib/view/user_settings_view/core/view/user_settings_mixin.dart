import 'package:new_weedus/export.dart';

mixin UserSettingsMixin on State<UserSettingsView> {
  final double _mobileDrawerSize = 60;
  final double _imageRadius = 32;
  final int _flexValue = 5;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  final String _fontFamily = 'Neuropolitical';
  List _drawerItems = [
    {"icon": Icons.account_circle, "name": 'Account Details'},
    {"icon": Icons.account_balance, "name": 'Bank Account'},
    {"icon": Icons.settings, "name": 'Preferences'},
    {"icon": Icons.add_shopping_cart_sharp, "name": 'Orders'},
    {"icon": Icons.logout, "name": 'Logout'},
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);

    _pageController = PageController(initialPage: userViewModel.settingIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void drawerRouteSelectionOnTap(int index) {
    print('Tapped drawer item at index: $index');

    if (_pageController.hasClients) {
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 3), curve: Curves.easeInOut);
    } else {
      print('Error: PageController is not valid.');
    }
  }

  double get mobileDrawerSize => _mobileDrawerSize;

  double get imageRadius => _imageRadius;

  PageController get pageController => _pageController;

  List get drawerItems => _drawerItems;

  int get flexValue => _flexValue;

  TextEditingController get nameController => _nameController;

  TextEditingController get dobController => _dobController;

  TextEditingController get phoneNumberController => _phoneNumberController;

  TextEditingController get addressController => _addressController;

  List<TextEditingController> get controllers =>
      [nameController, dobController, phoneNumberController, addressController];
}
