import 'package:learning_go_test/src/logger/dev_logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  final isBlocLogEnable = false;
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (isBlocLogEnable) {
      Dev.logLineWithTag(
        tag: 'Bloc Event',
        message: 'Event: ${bloc.runtimeType} -> $event',
      );
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (isBlocLogEnable) {
      Dev.logLineWithTag(
        tag: 'Bloc Event',
        message: 'State Change: ${bloc.runtimeType} -> $change',
      );
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (isBlocLogEnable) {
      Dev.logLineWithTag(
        tag: 'Bloc Event',
        message: 'Transition: ${bloc.runtimeType} -> $transition',
      );
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (isBlocLogEnable) {
      Dev.logLineWithTagError(
        tag: 'Bloc Event',
        message: 'Error in ${bloc.runtimeType}:',
        error: error,
      );
    }
  }
}
