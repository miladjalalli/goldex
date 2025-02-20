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
}
