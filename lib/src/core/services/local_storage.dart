
import 'package:hive_ce/hive.dart';
import 'package:learning_go_test/src/core/configs/hive_configs/hive_boxes.dart';
import 'package:learning_go_test/src/core/data/models/user_information.dart';
import 'package:learning_go_test/src/core/data/models/user_local_settings.dart';
import 'package:learning_go_test/src/localization/app_languages.dart';
import 'package:injectable/injectable.dart';

import '../../logger/dev_logger.dart';
import '../di/service_locator.dart';

@LazySingleton()
class LocalStorage {
  LocalStorage() {
    init();
  }
  //? Hive Boxes name
  //-------------
  static const String _userSettings = HiveBoxesName.userLocalSettingsBox;
  static const String _userInfo = HiveBoxesName.userInfoBox;
  //-------------
  //? Defualt values
  //-------------
  static UserLocalSettings _defualtUserLocalSettings =
      UserLocalSettings.defaultSettings;
  static UserInformation _defualtUserinfo = UserInformation.defaultValue;
  //-------------

  Future<void> init() async {
    try {
      Dev.logLine("HI INIT");

      // Open UserLocalSettings box
      var userSettingsBox = await Hive.openBox<UserLocalSettings>(
        _userSettings,
      );

      // Retrieve UserLocalSettings if it exists, otherwise use default
      if (userSettingsBox.isNotEmpty && userSettingsBox.get(0) != null) {
        Dev.logLine("USer settings not empty");
        var userSettings = userSettingsBox.get(0) as UserLocalSettings;
        Dev.logLineWithTag(
          tag: 'UserSettings',
          message:
              'User Settings Stored in Local => ${userSettings.toString()}',
        );
        _defualtUserLocalSettings = userSettings;
        AppLanguages.curreentLocal = userSettings.locale;
      } else {
        // Save default settings if no user settings found
        Dev.logLineWithTag(
          tag: 'UserSettings',
          message:
              'No User Settings Stored. Saving default ${_defualtUserLocalSettings.toString()}',
        );
        AppLanguages.curreentLocal = _defualtUserLocalSettings.locale;
        await sl<LocalStorage>().saveUserSettings(_defualtUserLocalSettings);
      }

      // Open UserInformation box
      var userInfoBox = await Hive.openBox<UserInformation>(_userInfo);

      // Retrieve UserInformation if it exists, otherwise use default
      if (userInfoBox.isNotEmpty && userInfoBox.get(0) != null) {
        Dev.logLine("USer settings not empty");

        var userInfo = userInfoBox.get(0) as UserInformation;
        Dev.logLineWithTag(
          tag: 'UserInformation',
          message: 'User Information from local => ${userInfo.toString()}',
        );
        if (userInfo.token == '') {
          _defualtUserinfo = userInfo;
        }
      } else {
        // Save default user info if no user info found
        Dev.logLineWithTag(
          tag: 'UserInformation',
          message: 'No User Information Stored. Saving default info',
        );
        await sl<LocalStorage>().saveUserInfo(_defualtUserinfo);
      }
    } catch (e) {
      Dev.logLine("Error during Hive initialization: $e");
    }
  }

  Future<void> deleteUserInfoLocalStorage() async {
    try {
      // Close all open Hive boxes

      // await Hive.deleteBoxFromDisk(_userSettings);
      // await Hive.deleteBoxFromDisk(_userInfo);
      // Delete all Hive boxes and data from disk
      await Hive.deleteFromDisk();
      Dev.logLine("Local Storage Deleted");

      // Reinitialize Hive after deletion
      await init();
    } catch (e) {
      Dev.logLine("Error during deletion or re-initialization: $e");
    }
  }

  String? getUserToken() {
    try {
      userinformation.token;
    } catch (e) {
      return null;
    }
    return null;
  }

  //? Getter
  //-------------
  Box<UserLocalSettings> get _userSettingsBox =>
      Hive.box<UserLocalSettings>(_userSettings);
  Box<UserInformation> get _userinfoBox => Hive.box<UserInformation>(_userInfo);
  UserLocalSettings get userSettings =>
      _userSettingsBox.get(0) ?? _defualtUserLocalSettings;
  UserInformation get userinformation =>
      _userinfoBox.get(0) ?? _defualtUserinfo;
  //-------------

  //? Setter
  //-------------
  Future<void> saveUserSettings(UserLocalSettings settings) async {
    _defualtUserLocalSettings = settings;
    await _userSettingsBox.put(0, settings);
  }

  Future<void> saveUserInfo(UserInformation info) async {
    _defualtUserinfo = info;
    await _userinfoBox.put(0, info);
  }

  // Future<void> resetMemory() async {
  //   try {
  //     _defualtUserLocalSettings = UserLocalSettings(
  //       theme: AppThemeType.light,
  //       locale: Locale(AppLocales.arabicLocale.languageCode),
  //       isFirstTimeOpenApp: false,
  //       userAuth: UserAuth.unauthorized,
  //     );

  //     _defualtUserinfo = UserInformation.defaultValue;
  //     _defualtUserLocalSettings = UserLocalSettings.defaultSettings;

  //     await _userSettingsBox.clear();
  //     await _userinfoBox.clear();

  //     await saveUserSettings(_defualtUserLocalSettings);
  //     await saveUserInfo(_defualtUserinfo);

  //     try {
  //       await FireBaseTokenMangment.deleteFCMToken();
  //     } catch (e) {
  //       Dev.logError("Error during delete Fcm token: $e");
  //     }

  //     Dev.logLine("Memory Reset Successfully");
  //   } catch (e) {
  //     Dev.logError("Error during memory reset: $e");
  //     throw CacheExcption();
  //   }
  // }

  //-------------
}
