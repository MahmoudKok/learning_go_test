import 'package:learning_go_test/src/core/enums/general_enums.dart';

extension RequestExtension on RequestState {
  bool get isLoading => this == RequestState.loading;
  bool get isIdle =>
      (this == RequestState.loading || this == RequestState.init);
  bool get isInit => this == RequestState.init;
  bool get isError => this == RequestState.error;
  bool get isSuccess => this == RequestState.success;
}
