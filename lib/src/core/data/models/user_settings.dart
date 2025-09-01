// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:hive_ce/hive.dart';

import 'package:json_annotation/json_annotation.dart';

import '../../configs/hive_configs/hive_type_ids.dart';

part 'user_settings.g.dart';

@HiveType(typeId: HiveTypeIds.userSettingsTypId)
@JsonSerializable()
class UserSettings extends HiveObject implements EquatableMixin {
  @HiveField(1)
  @JsonKey(name: "language")
  final String locale;

  UserSettings({required this.locale});

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);

  @override
  List<Object> get props => [locale];

  @override
  bool? get stringify => true;
  static var defaultValue = UserSettings(locale: 'en');

  UserSettings copyWith({String? locale}) {
    return UserSettings(locale: locale ?? this.locale);
  }
}
