import 'package:json_annotation/json_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum Gender {
  @JsonValue('male')
  male,
  @JsonValue('female')
  female
}
