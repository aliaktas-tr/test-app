import 'package:new_weedus/export.dart';

extension SizeHelper on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
}

extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      alpha,
      (red * value).round(),
      (green * value).round(),
      (blue * value).round(),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

extension StringEllipsisExtension on String {
  String truncateTo(int maxLength) =>
      (this.length <= maxLength) ? this : '${this.substring(0, maxLength)}...';
}

///
extension ExtendedString on String {
  String replaceWhitespace() {
    return this.replaceAll(RegExp(r"\s+"), "\n");
  }
}

extension RouteNameString on String {
  String routeNameReplaceWhitespace() {
    return this.replaceAll(RegExp(r"\s+"), "-");
  }
}

extension RouteNameReReplaceString on String {
  String routeNameReplaceHyphen() {
    return this.replaceAll(RegExp('[^A-Za-z0-9]'), ' ');
  }
}

/// HELPER MASK
MaskTextInputFormatter inputFormatter(String mask) {
  return MaskTextInputFormatter(
      mask: mask, //'(###) ###-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}

/// VALIDATOR
String? validateName(String? value) {
  if (value!.length < 2) {
    return 'Name must be more than 2 character';
  } else {
    return null;
  }
}

String? validateLastName(String? value) {
  if (value!.length < 2) {
    return 'Last Name must be more than 2 character';
  } else {
    return null;
  }
}

String? validateMobile(String? value) {
  if (value!.length != 14) {
    return 'Mobile Number must be of 10 digit';
  } else {
    return null;
  }
}

String? validateDot(String? value) {
  if (value!.length != 10) {
    return 'Enter your birth date';
  } else if (!isAdult(value)) {
    return 'You must be 21 or over to purchase product';
  } else {
    return null;
  }
}

String? validateStreet(String? value) {
  if (value!.length != 3) {
    return 'Enter valid address';
  } else {
    return null;
  }
}

String? validateBuildingEtc(String? value) {
  if (value!.length != 3) {
    return 'Enter valid address';
  } else {
    return null;
  }
}

String? validatePass(String? value) {
  if (value!.length != 6) {
    return 'Password must be at least 6 character';
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  var pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value!)) {
    return 'Enter Valid Email';
  } else {
    return null;
  }
}

/// ID GENERATOR

String generateRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}

bool isAdult(String birthDateString) {
  DateTime birthDate = DateFormat.yMd().parse(birthDateString);
  DateTime today = DateTime.now();

  int yearDiff = today.year - birthDate.year;
  int monthDiff = today.month - birthDate.month;
  int dayDiff = today.day - birthDate.day;

  return yearDiff > 21 ||
      yearDiff == 21 && monthDiff > 0 ||
      yearDiff == 21 && monthDiff == 0 && dayDiff >= 0;
}

formatPrice(dynamic format) {
  return NumberFormat.currency(locale: 'en_US', symbol: r'$', decimalDigits: 2)
      .format(format);
}

formatPriceWithOutSymbol(dynamic format) {
  return NumberFormat.currency(locale: 'en_US', symbol: r'', decimalDigits: 2)
      .format(format);
}
///first character from words
String getInitials({String? string, int? limitTo}) {
  var buffer = StringBuffer();
  var split = string!.split(' ');
  for (var i = 0; i < (limitTo ?? split.length); i++) {
    buffer.write(split[i][0].toUpperCase());
  }
  return buffer.toString();
}
