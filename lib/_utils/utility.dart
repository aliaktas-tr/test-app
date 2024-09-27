
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:new_weedus/export.dart';
import 'dart:developer' as developer;

/*final kAnalytics = FirebaseAnalytics.instance;
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final DatabaseReference kDatabase = FirebaseDatabase.instance.ref();
FirebaseStorage storage = FirebaseStorage.instance;
final Uuid uuid = Uuid();*/

void cprint(dynamic data, {String? errorIn, String? event}) {
  /// Print logs only in development mode
  if (kDebugMode) {
    if (errorIn != null) {
      print(
          '****************************** error ******************************');
      developer.log('[Error]',
          time: DateTime.now(), error: data, name: errorIn);
      print(
          '****************************** error ******************************');
    } else if (data != null) {
      developer.log(
        data,
        time: DateTime.now(),
      );
    }
    if (event != null) {
      Utility.logEvent(event);
    }
  }
}

class Utility {
  static String getPostTime2(String date) {
    if (date.isEmpty) {
      return '';
    }
    var dt = DateTime.parse(date).toLocal();
    var dat = DateFormat("dd MMM yy").format(dt);
    return dat;
  }

  static String getDob(String? date) {
    if (date == null || date.isEmpty) {
      return '';
    }
    var dt = DateTime.parse(date).toLocal();
    var dat = DateFormat.yMMMd().format(dt);
    return dat;
  }

  static String getJoiningDate(String date) {
    if (date.isEmpty) {
      return '';
    }
    var dt = DateTime.parse(date).toLocal();
    var dat = DateFormat("MMMM yyyy").format(dt);
    return 'Joined $dat';
  }

  static String? getSocialLinks(String url) {
    if (url.isNotEmpty) {
      url = url.contains("https://www") || url.contains("http://www")
          ? url
          : url.contains("www") &&
                  (!url.contains('https') && !url.contains('http'))
              ? 'https://' + url
              : 'https://www.' + url;
    } else {
      return null;
    }
    if (kDebugMode) {
      cprint('Launching URL : $url');
    }
    return url;
  }

  static void logEvent(String event, {Map<String?, dynamic>? parameter}) {
    kReleaseMode
        ? kAnalytics.logEvent(
            name: event, parameters: parameter as Map<String, Object>?)
        : print("[EVENT]: $event");
  }

  static void debugLog(String log, {dynamic param = ""}) {
    final String time = DateFormat("mm:ss:mmm").format(DateTime.now());
    print("[$time][Log]: $log, $param");
  }

  static List<String?> getHashTags(String text) {
    RegExp reg = RegExp(
        r"(#)\w+|(https?|ftp|file|#)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]*");
    Iterable<Match> _matches = reg.allMatches(text);
    List<String?> resultMatches = <String?>[];
    for (Match match in _matches) {
      if (match.group(0)!.isNotEmpty) {
        var tag = match.group(0);
        resultMatches.add(tag);
      }
    }
    return resultMatches;
  }

  static String getUserName({
    required String id,
    required String name,
  }) {
    String userName = '';
    if (name.length > 15) {
      name = name.substring(0, 6);
    }
    name = name.split(' ')[0];
    id = id.substring(0, 8).toLowerCase();
    userName = '@$name$id';
    return userName;
  }

  static bool validateEmail(String email) {
    String p =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    RegExp regExp = new RegExp(p);
    var status = regExp.hasMatch(email);
    return status;
  }
}
