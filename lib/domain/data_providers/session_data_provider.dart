import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const tokenUser = 'token';
  static const idUser = 'id';
}

class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> get tokenUser => _secureStorage.read(key: _Keys.tokenUser);

  Future<void> setTokenUser(String? token) {
    return _secureStorage.write(key: _Keys.tokenUser, value: token);
  }

  Future<void> deleteTokenUser() {
    return _secureStorage.delete(key: _Keys.tokenUser);
  }

  Future<String?> get idUser => _secureStorage.read(key: _Keys.idUser);

  Future<void> setUserId(int? id) {
    return _secureStorage.write(key: _Keys.idUser, value: id.toString());
  }

  Future<void> deleteUserId() {
    return _secureStorage.delete(key: _Keys.idUser);
  }
}
