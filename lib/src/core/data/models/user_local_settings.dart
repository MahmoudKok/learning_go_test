// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final userLocaleSettings = userLocaleSettingsFromMap(jsonString);

import 'package:hive_ce/hive.dart';
import 'package:learning_go_test/src/core/enums/user_auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../configs/hive_configs/hive_type_ids.dart';
import '../../enums/app_theme_types.dart';

part 'user_local_settings.g.dart';

@HiveType(typeId: HiveTypeIds.userLocalSettings)
class UserLocalSettings extends HiveObject implements EquatableMixin {
  @HiveField(0, defaultValue: true)
  final bool isFirstTimeOpenApp;
  @HiveField(1)
  AppThemeType theme;
  @HiveField(2)
  Locale locale;
  @HiveField(3)
  UserAuth userAuth;

  UserLocalSettings({
    required this.isFirstTimeOpenApp,
    required this.theme,
    required this.locale,
    required this.userAuth,
  });

  UserLocalSettings copyWith({
    bool? isFirstTimeOpenApp,
    AppThemeType? theme,
    Locale? locale,
    UserAuth? userAuth,
  }) {
    return UserLocalSettings(
      isFirstTimeOpenApp: isFirstTimeOpenApp ?? this.isFirstTimeOpenApp,
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
      userAuth: userAuth ?? this.userAuth,
    );
  }

  @override
  List<Object> get props => [isFirstTimeOpenApp, theme, locale, userAuth];

  @override
  bool? get stringify => true;

  static UserLocalSettings defaultSettings = UserLocalSettings(
    isFirstTimeOpenApp: true,
    theme: AppThemeType.light,
    locale: const Locale('ar'),
    userAuth: UserAuth.unauthorized,
  );

  @override
  String toString() =>
      'UserLocalSettings(isFirstTimeOpenApp: $isFirstTimeOpenApp, theme: $theme, locale: $locale , userAuth:$userAuth)';

  @override
  bool operator ==(covariant UserLocalSettings other) {
    if (identical(this, other)) return true;

    return other.isFirstTimeOpenApp == isFirstTimeOpenApp &&
        other.theme == theme &&
        other.locale == locale &&
        other.userAuth == userAuth;
  }

  @override
  int get hashCode =>
      isFirstTimeOpenApp.hashCode ^
      theme.hashCode ^
      locale.hashCode ^
      userAuth.hashCode;
}
