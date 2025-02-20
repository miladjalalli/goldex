import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageService {
  Future<void> writeToken(String value);
  Future<String?> readToken();
  Future<void> deleteToken();
}
