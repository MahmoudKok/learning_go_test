import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/di/service_locator.dart';
import '../core/services/local_storage.dart';
import '../logger/dev_logger.dart';

abstract class AppLanguages {
  static Locale curreentLocal = AppLocales.defualtLocale;
  static Future setLocale(BuildContext context, Locale locale) async {
    Dev.logLine('Try change to $locale');

    try {
      EasyLocalization.of(context)!.setLocale(locale);
      curreentLocal = locale;
      await sl<LocalStorage>().saveUserSettings(
        sl<LocalStorage>().userSettings.copyWith(locale: locale),
      );
      Dev.logLine('Lang change to $locale');
    } catch (e) {
      Dev.logError(e);
    }
  }

  static Locale get getCurrentLocale {
    return curreentLocal;
  }

  static bool get isArabic => curreentLocal == AppLocales.arabicLocale;
  static bool get isEnglish => curreentLocal == AppLocales.englishLocale;
  static List<Locale> get createSupportedLocals => const [
        AppLocales.englishLocale, // English
        AppLocales.arabicLocale, // Arabic
      ];
  static List<String> get localeNames => const [
        'English',
        'العربية',
      ];
}

class AppLocales {
  static const Locale arabicLocale = Locale('ar');
  static const Locale englishLocale = Locale('en');
  static const Locale defualtLocale = Locale('ar');
}
