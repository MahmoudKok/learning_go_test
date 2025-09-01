import 'package:json_annotation/json_annotation.dart';

part 'notifications_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum NotificationType {
  @JsonValue('general')
  general,

  @JsonValue('task')
  task,

  @JsonValue('report')
  report,

  @JsonValue('progress')
  progress,

  nan
}
