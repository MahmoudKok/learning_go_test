part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final RequestState requestState;
  final String message;
  final UserModel? user;
  final RequestState logoutState;

  const ProfileState({
    this.requestState = RequestState.init,
    this.message = '',
    this.user,
    this.logoutState = RequestState.init,
  });

  ProfileState copyWith({
    RequestState? requestState,
    String? message,
    UserModel? user,
    RequestState? logoutState,
  }) {
    return ProfileState(
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
      user: user ?? this.user,
      logoutState: logoutState ?? this.logoutState,
    );
  }

  @override
  List<Object?> get props => [requestState, message, user, logoutState];

  @override
  bool get stringify => true;
}
