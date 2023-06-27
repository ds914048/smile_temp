//TODO(YM): Use this service to log error/exceptions on console

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
  // level: Level.debug
);

void main() {
  if (kDebugMode) {
    print(
        'Run with either `dart example/main.dart` or `dart --enable-asserts example/main.dart`.');
  }
  demo();
}

void demo() {
  //debug
  logger.d('Log message with 2 methods');
  //info
  loggerNoStack.i('Info message');
  //warning
  loggerNoStack.w('Just a warning!');
  //error
  logger.e('Error! Something bad happened', 'Test Error');
  //verbose
  loggerNoStack.v({'key': 5, 'value': 'something'});
  Logger(printer: SimplePrinter(colors: true)).v('boom');
}
