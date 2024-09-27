import 'package:new_weedus/export.dart';

class Validations {
  static String? validateName(String? value) {
    if (value!.isEmpty) return 'Name is Required.';
    if(value.length < 3) return 'Name must be at least 3 characters.';
    final RegExp nameExp = new RegExp(r'^[A-za-zğüşöçİĞÜŞÖÇ ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  static String? validateEmail(String? value, [bool isRequired = true]) {
    if (value!.isEmpty && isRequired) return 'Email is required.';
    final RegExp nameExp = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (!nameExp.hasMatch(value) && isRequired) return 'Invalid email address';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty || value.length < 6)
      return 'Please enter a valid password.';
    return null;
  }

  static bool validateCredentials(BuildContext context,
      GlobalKey<ScaffoldState> _scaffoldKey, String email, String password) {
    if (email.isEmpty) {
      SignInWidgets.signInSnackBar(
        context,
        _scaffoldKey,
        '${'enterEmailId'.tr()}',
      );
      return false;
    } else if (password.isEmpty) {
      SignInWidgets.signInSnackBar(
          context, _scaffoldKey, '${'enterPassword'.tr()}');
      return false;
    } else if (password.length < 6) {
      SignInWidgets.signInSnackBar(
          context, _scaffoldKey, '${
          'passMinError'.tr()}');
      return false;
    }

    var status = validateEmail2(email);
    if (!status) {
      SignInWidgets.signInSnackBar(
          context, _scaffoldKey, '${'validEmailId'.tr()}');
      return false;
    }
    return true;
  }

  static bool validateEmail2(String email) {
    String p =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    RegExp regExp = new RegExp(p);
    var status = regExp.hasMatch(email);
    return status;
  }
}
