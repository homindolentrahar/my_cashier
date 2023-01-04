import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_cashier/util/constant/constants.dart';

class SecureStorageHelper {
  late FlutterSecureStorage _storage;

  static SecureStorageHelper get instance => SecureStorageHelper._internal();

  SecureStorageHelper._internal() {
    _storage = const FlutterSecureStorage();
  }

  Future<void> saveUserCredential(String email) async {
    _storage.write(key: Constants.userCredentialKey, value: email);
  }

  Future<String?> getUserCredential() async {
    return await _storage.read(key: Constants.userCredentialKey);
  }

  Future<void> clearCredential() async {
    _storage.delete(key: Constants.userCredentialKey);
  }
}
