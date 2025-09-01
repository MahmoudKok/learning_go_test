import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../logger/dev_logger.dart';

@LazySingleton()
class SecureStorageServices {
  final FlutterSecureStorage _storage;
  final String _pinKey;

  bool _isHavePin = false;

  SecureStorageServices()
    : _storage = const FlutterSecureStorage(),
      _pinKey = dotenv.get('APP_PASSWORD', fallback: 'app_pin_default');

  /// Initializes the service by checking if a PIN exists
  Future<void> init() async {
    _isHavePin = await hasPin();
  }

  /// Getter for whether a PIN is set
  bool get isHavePin => _isHavePin;

  /// Loads the PIN from secure storage
  Future<String?> loadPin() async {
    try {
      final storedPin = await _storage.read(key: _pinKey);
      return storedPin;
    } catch (e) {
      Dev.logError('Error loading PIN: $e');
      return null;
    }
  }

  /// Saves the PIN to secure storage
  Future<void> savePin(String pin) async {
    try {
      await _storage.write(key: _pinKey, value: pin);
      _isHavePin = true;
    } catch (e) {
      Dev.logError('Error saving PIN: $e');
    }
  }

  /// Deletes the PIN from secure storage
  Future<void> deletePin() async {
    try {
      await _storage.delete(key: _pinKey);
      _isHavePin = false;
    } catch (e) {
      Dev.logError('Error deleting PIN: $e');
    }
  }

  /// Checks if a PIN is set (not null or empty)
  Future<bool> hasPin() async {
    final pin = await loadPin();
    return pin != null && pin.isNotEmpty;
  }

  /// Verifies if the provided PIN matches the stored one
  Future<bool> verifyPin(String pin) async {
    final storedPin = await loadPin();
    return storedPin == pin;
  }
}
