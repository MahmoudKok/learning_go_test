part of 'splash_bloc.dart';

class SplashEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SplashStarted extends SplashEvent {
  SplashStarted({
    required this.appName,
    this.typingSpeed = const Duration(milliseconds: 70),
    this.blinkSpeed = const Duration(milliseconds: 450),
    this.pauseAfterTyping = const Duration(milliseconds: 600),
  });
  final String appName;
  final Duration typingSpeed;
  final Duration blinkSpeed;
  final Duration pauseAfterTyping;
}

class _TypingTick extends SplashEvent {}

class _BlinkTick extends SplashEvent {}

class _TypingFinished extends SplashEvent {}
