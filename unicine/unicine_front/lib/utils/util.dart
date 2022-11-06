import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

Future<void> saveData({required String key, required String data}) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: key, value: data);
}

Future<String?> loadData(String key) async {
  try {
    const storage = FlutterSecureStorage();
    final res = await storage.read(key: key);
    return res;
  } catch (e) {
    log(_runtimeType, e.toString());
    return null;
  }
}

String get _runtimeType => 'util';
