part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

/// Fired when username text changes
class UsernameChangedEvent extends SignInEvent {
  const UsernameChangedEvent(this.username);
  final String username;

  @override
  List<Object?> get props => [username];
}

/// Fired when password text changes
class PasswordChangedEvent extends SignInEvent {
  const PasswordChangedEvent(this.password);
  final String password;

  @override
  List<Object?> get props => [password];
}

/// Fired when user toggles password visibility
class TogglePasswordObscureEvent extends SignInEvent {
  const TogglePasswordObscureEvent();
}

/// Fired when user submits the form
class SubmitSignInEvent extends SignInEvent {
  const SubmitSignInEvent();
}

/// Internal event when validation needs to be re-run
class ValidateFieldsEvent extends SignInEvent {
  const ValidateFieldsEvent();
}

/// To reset state (optional)
class ResetSignInEvent extends SignInEvent {
  const ResetSignInEvent();
}
