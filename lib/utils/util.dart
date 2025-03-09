import 'package:intl/intl.dart';
import 'dart:js' as js;
import 'package:flutter/foundation.dart' show kIsWeb;

class Util {
  String getEnvVariable(String key, {String defaultValue = ''}) {
    if (kIsWeb) {
      // Read from JavaScript-injected environment variable
      final env = js.context.hasProperty('env') ? js.context['env'][key] : defaultValue;
      return env ?? 'development';
    } else {
      return String.fromEnvironment(key, defaultValue: defaultValue);
    }
  }


  static String getDateString(DateTime date) {
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static DateTime parseDate(String date) {
    return DateFormat('dd-MMM-yyyy').parse(date);
  }

}