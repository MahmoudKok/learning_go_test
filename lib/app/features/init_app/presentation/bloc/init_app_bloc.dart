import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../src/core/data/models/user_local_settings.dart';
import '../../../../../src/core/di/service_locator.dart';
import '../../../../../src/core/enums/app_theme_types.dart';
import '../../../../../src/core/services/local_storage.dart';
import '../../../../../src/localization/app_languages.dart';
import '../../../../../src/resources/theme_manager.dart';

part 'init_app_event.dart';
part 'init_app_state.dart';

@LazySingleton()
class InitAppBloc extends Bloc<InitAppEvent, InitAppState> {
  InitAppBloc() : super(InitAppState.initial()) {
    on<LoadUserSettingsEvent>(_loadUserSettings);
    on<ChangeAppThemeEvent>(_changeAppTheme);
  }

  FutureOr<void> _loadUserSettings(event, Emitter<InitAppState> emit) async {
    UserLocalSettings storedUserSettings = sl<LocalStorage>().userSettings;
    AppThemes.changeCurrentTheme(storedUserSettings.theme);
    AppLanguages.curreentLocal = storedUserSettings.locale;
    emit(state.copyWith(userSettings: storedUserSettings));
  }

  Future<void> _changeAppTheme(
    ChangeAppThemeEvent event,
    Emitter<InitAppState> emit,
  ) async {
    AppThemeType type;
    if (sl<LocalStorage>().userSettings.theme == AppThemeType.light) {
      type = AppThemeType.dark;
    } else {
      type = AppThemeType.light;
    }
    final newUserSettings = sl<LocalStorage>().userSettings.copyWith(
      theme: type,
    );
    await sl<LocalStorage>().saveUserSettings(newUserSettings);
    AppThemes.changeCurrentTheme(type);
    emit(state.copyWith(userSettings: newUserSettings));
  }
}
