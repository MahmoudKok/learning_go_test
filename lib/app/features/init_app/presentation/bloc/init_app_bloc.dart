import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../src/core/data/models/user_local_settings.dart';
import '../../../../../src/core/di/service_locator.dart';
import '../../../../../src/core/services/local_storage.dart';
import '../../../../../src/localization/app_languages.dart';
import '../../../../../src/resources/theme_manager.dart';

part 'init_app_event.dart';
part 'init_app_state.dart';

@LazySingleton()
class InitAppBloc extends Bloc<InitAppEvent, InitAppState> {
  InitAppBloc() : super(InitAppState.initial()) {
    on<LoadUserSettingsEvent>(_loadUserSettings);
  }

  FutureOr<void> _loadUserSettings(event, Emitter<InitAppState> emit) async {
    UserLocalSettings storedUserSettings = sl<LocalStorage>().userSettings;
    AppThemes.changeCurrentTheme(storedUserSettings.theme);
    AppLanguages.curreentLocal = storedUserSettings.locale;
    emit(state.copyWith(userSettings: storedUserSettings));
  }
}
