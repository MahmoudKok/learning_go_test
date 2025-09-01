import 'package:hive_ce/hive.dart';
import 'package:learning_go_test/src/core/enums/user_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

import '../../../logger/dev_logger.dart';
import '../../data/models/user_information.dart';
import '../../data/models/user_local_settings.dart';
import '../../data/models/user_settings.dart';
import '../../enums/app_theme_types.dart';
import 'hive_boxes.dart';
import 'hive_custom_adapters/hive_locale_adapter.dart';
import 'hive_type_ids.dart';

abstract class HiveInitializer {
  static Future<void> initialize() async {
    Dev.logLine('HiveInitializer');
    try {
      var documentsDirectory = await getApplicationDocumentsDirectory();

      Hive.init(documentsDirectory.path);
      bool isNotRegistered(int typeId) {
        return !Hive.isAdapterRegistered(typeId);
      }

      //* Register Adapters
      if (isNotRegistered(HiveTypeIds.userSettingsTypId)) {
        Hive.registerAdapter<UserSettings>(UserSettingsAdapter());
      }
      if (isNotRegistered(HiveTypeIds.userLocalSettings)) {
        Hive.registerAdapter<UserLocalSettings>(UserLocalSettingsAdapter());
      }
      if (isNotRegistered(HiveTypeIds.userInfoTypId)) {
        Hive.registerAdapter<UserInformation>(UserInformationAdapter());
      }
      if (isNotRegistered(HiveTypeIds.locale)) {
        Hive.registerAdapter<Locale>(LocaleAdapter());
      }
      if (isNotRegistered(HiveTypeIds.themeType)) {
        Hive.registerAdapter<AppThemeType>(AppThemeTypeAdapter());
      }
      // if (isNotRegistered(HiveTypeIds.sector)) {
      //   Hive.registerAdapter<SectorEntity>(SectorEntityAdapter());
      // }
      if (isNotRegistered(HiveTypeIds.userAuth)) {
        Hive.registerAdapter<UserAuth>(UserAuthAdapter());
      }

      // Open Boxes
      await Hive.openBox<UserSettings>(HiveBoxesName.userSettingsBox);
      await Hive.openBox<UserLocalSettings>(HiveBoxesName.userLocalSettingsBox);
      await Hive.openBox<UserInformation>(HiveBoxesName.userInfoBox);

      Dev.logSuccess('FINISH HiveInitializer');
    } catch (e) {
      Dev.logError('HiveInitializer Error $e');
    }
  }
}
