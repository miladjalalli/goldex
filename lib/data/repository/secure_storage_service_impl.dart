import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:goldex/core/constants.dart';
import 'package:goldex/domain/repository/secure_storage_service.dart';

class SecureStorageServiceImpl implements SecureStorageService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  Future<void> writeToken(String value) async {
    await _storage.write(key: Constants.USER_TOKEN, value: value);
  }

  @override
  Future<String?> readToken() async {
    return await _storage.read(key: Constants.USER_TOKEN);
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: Constants.USER_TOKEN);
  }

  @override
  Future<void> writeMobile(String value) async {
    await _storage.write(key: Constants.USER_MOBILE, value: value);
  }

  @override
  Future<String?> readMobile() async {
    return await _storage.read(key: Constants.USER_MOBILE);
  }

  @override
  Future<void> deleteMobile() async {
    await _storage.delete(key: Constants.USER_MOBILE);
  }

  @override
  Future<void> writePassword(String value) async {
    await _storage.write(key: Constants.USER_PASSWORD, value: value);
  }

  @override
  Future<String?> readPassword() async {
    return await _storage.read(key: Constants.USER_PASSWORD);
  }

  @override
  Future<void> deletePassword() async {
    await _storage.delete(key: Constants.USER_PASSWORD);
  }

  @override
  Future<void> writeName(String value) async {
    await _storage.write(key: Constants.USER_NAME, value: value);
  }

  @override
  Future<String?> readName() async {
    return await _storage.read(key: Constants.USER_NAME);
  }

  @override
  Future<void> deleteName() async {
    await _storage.delete(key: Constants.USER_NAME);
  }

  @override
  Future<void> writeFamily(String value) async {
    await _storage.write(key: Constants.USER_FAMILY, value: value);
  }

  @override
  Future<String?> readFamily() async {
    return await _storage.read(key: Constants.USER_FAMILY);
  }

  @override
  Future<void> deleteFamily() async {
    await _storage.delete(key: Constants.USER_FAMILY);
  }

  @override
  Future<void> writeFirstLogin(String value) async {
    await _storage.write(key: Constants.FIRST_LOGIN, value: value);
  }

  @override
  Future<String?> readFirstLogin() async {
    return await _storage.read(key: Constants.FIRST_LOGIN);
  }

  @override
  Future<void> deleteFirstLogin() async {
    await _storage.delete(key: Constants.FIRST_LOGIN);
  }
}
