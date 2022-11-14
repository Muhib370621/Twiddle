import 'package:flutter/foundation.dart';

///This logger will log and print only in debug mode
class Logger {
  static log(value) {
    if (kDebugMode) {
      log(value);
    }
  }

  static print(value) {
    if (kDebugMode) {
      print(value);
    }
  }
}