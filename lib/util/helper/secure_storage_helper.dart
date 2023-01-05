import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:my_cashier/util/constant/constants.dart';

class SecureStorageHelper {
  late FlutterSecureStorage _storage;

  static SecureStorageHelper get instance => SecureStorageHelper._internal();

  SecureStorageHelper._internal() {
    _storage = const FlutterSecureStorage();
  }

  Future<void> saveUserCredential({
    required int id,
    required String email,
  }) async {
    Logger().i("Saving Credential: ${{
      'id': id,
      'email': email,
    }}");
    _storage.write(
      key: Constants.userCredentialKey,
      value: json.encode({
        'id': id,
        'email': email,
      }),
    );
  }

  Future<Map<String, dynamic>?> getUserCredential() async {
    final data = json.decode(
      await _storage.read(key: Constants.userCredentialKey) ?? "{}",
    );
    Logger().i("Getting credential: $data");

    return data;
  }

  Future<void> clearCredential() async {
    _storage.delete(key: Constants.userCredentialKey);
  }
}
