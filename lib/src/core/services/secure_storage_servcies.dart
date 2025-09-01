import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../logger/dev_logger.dart';

@LazySingleton()
class SecureStorageServices {
  final FlutterSecureStorage _storage;
  final String _accessKey = 'access_token';
  final String _refreshKey = 'refresh_token';

  String? _accessToken;
  String? _refreshToken;

  String? get token => _accessToken;
  String? get refreshToken => _refreshToken;

  SecureStorageServices() : _storage = const FlutterSecureStorage();

  Future<void> init() async {
    _accessToken = await loadAccessToken();
    _refreshToken = await loadRefreshToken();
  }

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      await _storage.write(key: _accessKey, value: accessToken);
      await _storage.write(key: _refreshKey, value: refreshToken);
      _accessToken = accessToken;
      _refreshToken = refreshToken;
    } catch (e) {
      Dev.logError('Error saving tokens: $e');
    }
  }

  Future<String?> loadAccessToken() async {
    try {
      final token = await _storage.read(key: _accessKey);
      return token;
    } catch (e) {
      Dev.logError('Error loading access token: $e');
      return null;
    }
  }

  Future<String?> loadRefreshToken() async {
    try {
      final token = await _storage.read(key: _refreshKey);
      return token;
    } catch (e) {
      Dev.logError('Error loading refresh token: $e');
      return null;
    }
  }

  Future<void> clear() async {
    try {
      await _storage.delete(key: _accessKey);
      await _storage.delete(key: _refreshKey);
      _accessToken = null;
      _refreshToken = null;
    } catch (e) {
      Dev.logError('Error clearing tokens: $e');
    }
  }
}
