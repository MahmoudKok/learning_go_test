enum RequestState { init, loading, success, error }

enum ScreenState { init, waiting, done, wrong }

enum ButtonStatus {
  init,
  loading,
  error,
  success,
}

enum ApiResponseStatus {
  success,
  error,
  sessionExpired,
}
