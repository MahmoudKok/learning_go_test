import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@Injectable()
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState.initial()) {
    on<SplashStarted>(_onStarted);
    on<_TypingTick>(_onTypingTick);
    on<_BlinkTick>(_onBlinkTick);
    on<_TypingFinished>(_onTypingFinished);
  }

  Timer? _typingTimer;
  Timer? _blinkTimer;
  Duration _typingSpeed = const Duration(milliseconds: 70);
  Duration _blinkSpeed = const Duration(milliseconds: 450);
  Duration _pauseAfterTyping = const Duration(milliseconds: 600);

  void _onStarted(SplashStarted event, Emitter<SplashState> emit) {
    _typingSpeed = event.typingSpeed;
    _blinkSpeed = event.blinkSpeed;
    _pauseAfterTyping = event.pauseAfterTyping;

    emit(
      state.copyWith(
        appName: event.appName,
        visibleChars: 0,
        showCaret: true,
        isDone: false,
      ),
    );

    _typingTimer?.cancel();
    _typingTimer = Timer.periodic(_typingSpeed, (_) => add(_TypingTick()));

    _blinkTimer?.cancel();
    _blinkTimer = Timer.periodic(_blinkSpeed, (_) => add(_BlinkTick()));
  }

  void _onTypingTick(_TypingTick event, Emitter<SplashState> emit) {
    final total = state.appName.runes.length;
    if (state.visibleChars < total) {
      emit(state.copyWith(visibleChars: state.visibleChars + 1));
    } else {
      _typingTimer?.cancel();
      add(_TypingFinished());
    }
  }

  void _onBlinkTick(_BlinkTick event, Emitter<SplashState> emit) {
    // Blink caret while typing; hide it when done.
    if (!state.isDone) {
      emit(state.copyWith(showCaret: !state.showCaret));
    }
  }

  Future<void> _onTypingFinished(
    _TypingFinished event,
    Emitter<SplashState> emit,
  ) async {
    emit(state.copyWith(isDone: true, showCaret: false));
    await Future.delayed(_pauseAfterTyping);
    // Let UI navigate via listener when isDone == true
  }

  @override
  Future<void> close() {
    _typingTimer?.cancel();
    _blinkTimer?.cancel();
    return super.close();
  }
}
