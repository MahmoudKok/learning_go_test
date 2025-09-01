import 'package:hive_ce_flutter/adapters.dart';
import 'package:learning_go_test/src/core/Api/base_urls.dart';
import 'package:learning_go_test/src/core/configs/hive_configs/hive_initializer.dart';
import 'package:learning_go_test/src/core/di/service_locator.dart';
import 'package:learning_go_test/src/core/router/app_router.dart';
import 'package:learning_go_test/src/core/services/secure_storage_servcies.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import '../../../firebase_options.dart';

abstract class AppInitializer {
  static init() async {
    //-- Flutter init --
    WidgetsFlutterBinding.ensureInitialized();

    /// Get the directory where Hive stores data
    // final appDocumentDir = await getApplicationDocumentsDirectory();
    // final hiveDir = Directory(appDocumentDir.path); // Hive storage directory

    // // Delete the Hive storage directory if it exists
    // if (hiveDir.existsSync()) {
    //   hiveDir.deleteSync(recursive: true);
    // }
    // --- Init Firebase ---
    // Dev.logList(Firebase.apps, listName: 'Firebase');

    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    // await setupFirebaseMessaging();
    // Handle notifications that opened the app from a terminated state
    // await handleInitialMessage();

    //-- ENV FILE LOAD  --
    await dotenv.load(fileName: '.env');
    //-- Load base URL's  --
    BaseUrls.init();
    //-- Hive initialize --
    await Hive.initFlutter();
    //-- Hive initialize Boxes --
    await HiveInitializer.initialize();
    //-- Dependency inijection  --
    await configurationDependencies();
    //-- Local Storage init --
    // sl<LocalStorage>().init();
    //-- Notification Service init --

    // await sl<NotificationService>().initialize(true);
    //-- Router init --
    AppRouter.init();
    //-- Localization init  --
    await EasyLocalization.ensureInitialized();
    await sl<SecureStorageServices>().init();

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
