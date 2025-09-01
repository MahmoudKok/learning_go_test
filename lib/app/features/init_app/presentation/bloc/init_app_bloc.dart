import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../src/core/data/models/user_local_settings.dart';

part 'init_app_event.dart';
part 'init_app_state.dart';

class InitAppBloc extends Bloc<InitAppEvent, InitAppState> {
  InitAppBloc() : super(InitAppState.initial());
}
