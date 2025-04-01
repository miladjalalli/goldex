import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageService {
  Future<void> writeToken(String value);
  Future<String?> readToken();
  Future<void> deleteToken();

  Future<void> writePassword(String value);
  Future<String?> readPassword();
  Future<void> deletePassword();


  Future<void> writeMobile(String value);
  Future<String?> readMobile();
  Future<void> deleteMobile();


  Future<void> writeName(String value);
  Future<String?> readName();
  Future<void> deleteName();


  Future<void> writeFamily(String value);
  Future<String?> readFamily();
  Future<void> deleteFamily();

  Future<void> writeFirstLogin(String value);
  Future<String?> readFirstLogin();
  Future<void> deleteFirstLogin();

}
