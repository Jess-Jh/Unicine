import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

bool isValidEmail({required String email}) {
  return RegExp(
          r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}

log(dynamic runtimeType, dynamic message) {
  try {
    if (kDebugMode) {
      // print('$runtimeType: $message');
      final logger = Logger(
        printer: PrettyPrinter(
          colors: true,
          noBoxingByDefault: true,
          printEmojis: true,
        ),
      );
      logger.d("$runtimeType, $message");
    }
  } catch (_) {}
}
