class AuthTokenManager {
  static final AuthTokenManager _instance = AuthTokenManager._internal();

  factory AuthTokenManager() => _instance;

  AuthTokenManager._internal();

  String? _token;

  void setToken(String? token) {
    _token = token;
  }

  String? get token => _token;
}
