part of 'init_app_bloc.dart';

abstract class InitAppEvent extends Equatable {
  const InitAppEvent();
  @override
  List<Object?> get props => [];
}

class LoadUserSettingsEvent extends InitAppEvent {}
