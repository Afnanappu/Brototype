// ignore_for_file: constant_identifier_names
import 'dart:core';

import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

const _PASS_BOX = 'passBox';

//Opened a box for item so we can use it any time
late Box _passBox;

Future<void> setPassword(String value) async {
  /// Sets the password in the Hive box.
  ///
  /// This function opens the Hive box [_PASS_BOX] and stores the password value.
  /// The password is saved under the key `'password'`.
  ///
  /// - [password]: The string value of the password to be stored.
  /// - This function logs the stored password after saving it.
  ///
  /// Example:
  /// ```dart
  /// setPassword("my_secure_password");
  /// ```
  _passBox = await Hive.openBox(_PASS_BOX);
  await _passBox.put('password', value);
  log('Password is set to $value');
}

Future<String> getPassword() async {
  _passBox = await Hive.openBox(_PASS_BOX);
  log('password is getting from the DB');
  return await _passBox.get('password');
}

Future<bool?> havePassword([bool? value]) async {
  _passBox = await Hive.openBox(_PASS_BOX);
  if (value != null) {
    log('have password = $value');
    await _passBox.put('havePassword', value);
  } else {
    log('have password is getting');
    return _passBox.get('havePassword');
  }
  return null;
}
