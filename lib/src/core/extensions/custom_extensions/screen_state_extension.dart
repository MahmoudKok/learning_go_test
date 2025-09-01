import 'package:learning_go_test/src/core/enums/general_enums.dart';

extension ScreenStateExtension on ScreenState {
  bool get isDone => this == ScreenState.done;
  bool get isWaiting => this == ScreenState.waiting;
  bool get isInit => this == ScreenState.init;
  bool get isWrong => this == ScreenState.wrong;
  bool get isIdle => this == ScreenState.init || this == ScreenState.waiting;
}
