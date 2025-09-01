part of 'splash_bloc.dart';

class SplashState extends Equatable {
  const SplashState({
    required this.appName,
    required this.visibleChars,
    required this.showCaret,
    required this.isDone,
  });

  final String appName;
  final int visibleChars;
  final bool showCaret;
  final bool isDone;

  SplashState copyWith({
    String? appName,
    int? visibleChars,
    bool? showCaret,
    bool? isDone,
  }) {
    return SplashState(
      appName: appName ?? this.appName,
      visibleChars: visibleChars ?? this.visibleChars,
      showCaret: showCaret ?? this.showCaret,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [appName, visibleChars, showCaret, isDone];

  static SplashState initial() => const SplashState(
    appName: '',
    visibleChars: 0,
    showCaret: true,
    isDone: false,
  );
}
