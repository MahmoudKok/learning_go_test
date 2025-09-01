import 'package:json_annotation/json_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum AgeUnit {
  @JsonValue('week')
  week,
  @JsonValue('month')
  month,
  @JsonValue('year')
  year
}
