import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  static final SecureStorage _instance = SecureStorage._();

  SecureStorage._();

  factory SecureStorage() => _instance;

  Future<void> setToken(String token) =>
      _storage.write(key: 'token', value: token);

  Future<String> get token => _storage.read(key: 'token');
}
