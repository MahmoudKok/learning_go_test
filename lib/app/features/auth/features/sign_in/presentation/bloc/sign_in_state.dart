part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  const SignInState({
    required this.signInState,
    required this.params,
    this.response,
    this.errorMessage,
    this.obscurePassword = true,
    this.usernameError,
    this.passwordError,
    this.usernameDirty = false,
    this.passwordDirty = false,
  });

  /// Request state for /auth/login
  final RequestState signInState;

  /// Parameters sent to API
  final SignInParams params;

  /// Response from API
  final SignInResponse? response;

  /// Error message (network/server/validation)
  final String? errorMessage;

  /// UI helpers for validation
  final bool obscurePassword;
  final String? usernameError;
  final String? passwordError;
  final bool usernameDirty;
  final bool passwordDirty;

  /// Derived helpers
  bool get isSubmitting => signInState == RequestState.loading;
  bool get isSuccess => signInState == RequestState.success;
  bool get isFailure => signInState == RequestState.error;
  bool get isValid =>
      (usernameError == null && passwordError == null) &&
      params.username.trim().isNotEmpty &&
      params.password.isNotEmpty;

  factory SignInState.initial() => const SignInState(
    signInState: RequestState.init, // or RequestState.initial per your enum
    params: SignInParams(username: '', password: ''),
    response: null,
    errorMessage: null,
    obscurePassword: true,
    usernameError: null,
    passwordError: null,
    usernameDirty: false,
    passwordDirty: false,
  );

  SignInState copyWith({
    RequestState? signInState,
    SignInParams? params,
    SignInResponse? response,
    String? errorMessage,
    bool? obscurePassword,
    String? usernameError,
    String? passwordError,
    bool? usernameDirty,
    bool? passwordDirty,
  }) {
    return SignInState(
      signInState: signInState ?? this.signInState,
      params: params ?? this.params,
      response: response ?? this.response,
      errorMessage: errorMessage,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      usernameError: usernameError,
      passwordError: passwordError,
      usernameDirty: usernameDirty ?? this.usernameDirty,
      passwordDirty: passwordDirty ?? this.passwordDirty,
    );
  }

  @override
  List<Object?> get props => [
    signInState,
    params,
    response,
    errorMessage,
    obscurePassword,
    usernameError,
    passwordError,
    usernameDirty,
    passwordDirty,
  ];
}
