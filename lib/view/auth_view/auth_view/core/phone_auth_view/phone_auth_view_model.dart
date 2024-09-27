import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:new_weedus/export.dart';


class PhoneAuthViewModel extends ChangeNotifier {
  final DateTime _dob =
      DateTime(1950, DateTime.now().month, DateTime.now().day + 3);
  bool loading = false;
  final String _enterPhoneTitle = 'Please enter phone number';
  final String _enterValidPhoneTitle = 'Please enter valid phone number';
  final String _providedPhoneTitle = 'The provided phone number is not valid.';
  final int _phoneNumLength = 10;

  String _verificationID = '';
  MobileVerificationState _mobileVerificationState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? _phoneController = TextEditingController();
  TextEditingController? _countryController = TextEditingController();
  TextEditingController? _otpController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  //GETTERS
  TextEditingController get phoneController => _phoneController!;

  TextEditingController get otpController => _otpController!;

  TextEditingController get countryController => _countryController!;

  MobileVerificationState get mobileVerificationState =>
      _mobileVerificationState;

  bool get showLoading => _showLoading;

  String get verificationID => _verificationID;
  bool _showLoading = false;

  GlobalKey<FormState> get formKey => _formKey;

//FUNCTIONS
/*  Future<void> phoneSignInOnTap(BuildContext context, AuthState authState,
      GlobalKey<ScaffoldState> scaffoldKey) async {
    FocusManager.instance.primaryFocus!.unfocus();
    if (_phoneController!.text.isEmpty) {
      AppViewWidgets.customSnackBar(context,_enterPhoneTitle);
      _showLoading = false;
      notifyListeners();
    } else if (_phoneController!.text.length < _phoneNumLength) {
      AppViewWidgets.customSnackBar(
          context, _enterValidPhoneTitle);
      _showLoading = false;
      notifyListeners();
    } else if (_formKey.currentState!.validate() == true) {
      _showLoading = true;
      notifyListeners();
      authState.loginWithPhone(
        context,
        scaffoldKey,
        phoneNumber: _phoneController!.text,
        showLoading: _showLoading,
        verificationCompleted: (phoneAuthCredential) async {
          _showLoading = false;
          notifyListeners();
        },
        codeSent: (verificationId, resendingToken) async {
          _showLoading = false;
          _mobileVerificationState =
              MobileVerificationState.SHOW_OTP_FORM_STATE;
          this._verificationID = verificationId;
          notifyListeners();
        },
      );
    } else {
      AppViewWidgets.customSnackBar(context, _providedPhoneTitle);
      _showLoading = false;
      notifyListeners();
    }
  }

  Future<void> verifyOpt(
      BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
      {VoidCallback? loginCallBack}) async {
    var authState = Provider.of<AuthState>(context, listen: false);

    try {
      UserModel user = UserModel(
          displayName: '',
          phoneNumber: _phoneController!.text,
          isPhoneVerified: true,
          dob: _dob.toString(),
          location: '',
          profileImage: '',
          isVerified: false);

      authState
          .vO(context, scaffoldKey,
              verificationID: _verificationID,
              smsCode: _otpController!.text,
              phoneNumber: _phoneController!.text,
              userModel: user)
          .then((status) {
        print('User status : $status');
      }).whenComplete(() {
        loginCallBack!();
        notifyListeners();
      });
    } catch (e) {
      cprint(e);
    }
  }*/

  void uploadProfileImage(
      BuildContext context,
      UploadProfileImageViewModel viewModel,
      GlobalKey<ScaffoldState> _scaffoldKey) async {
    loading = true;
    notifyListeners();
    var authState = Provider.of<AuthState>(context, listen: false);
    var model = authState.userModel!.copyWith(
        profileImage: authState.userModel!.profileImage,
        displayName: nameController.text);
    if (nameController.text.isEmpty) {
      loading = false;
      notifyListeners();
      SignInWidgets.signInSnackBar(
          context, _scaffoldKey, 'fillForm');
      return;
    }
    if (nameController.text.isNotEmpty) {
      if (nameController.text.length < 4) {
        loading = false;
        notifyListeners();
        SignInWidgets.signInSnackBar(
            context, _scaffoldKey, 'shortName'.tr());

        return;
      }
    }
    if (nameController.text.length > 27) {
      loading = false;
      notifyListeners();
      SignInWidgets.signInSnackBar(
          context, _scaffoldKey, 'longName'.tr());
      return;
    }
    if (nameController.text.isNotEmpty) {
      model.displayName = nameController.text;
    }
    //await authState.updateUserProfile(model, profileImage: viewModel.mediaUrl);
    loading = false;
    notifyListeners();
  }

  onChanged(PhoneNumber number) {
    _phoneController!.text = number.completeNumber;
    notifyListeners();
  }

  onCountryChanged(Country country) {
    _countryController!.text = country.dialCode;
    notifyListeners();
  }
}
