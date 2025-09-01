// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'general_type.g.dart';

// @JsonSerializable(genericArgumentFactories: true)
// class GeneralType<T> extends Equatable {
//   final int id;

//   @JsonEnum(alwaysCreate: true)
//   final T type;

//   String name;

//   GeneralType({
//     required this.id,
//     required this.type,
//     required this.name,
//   });

//   GeneralType<T> copyWith({
//     int? id,
//     T? type,
//     String? name,
//   }) {
//     return GeneralType<T>(
//       id: id ?? this.id,
//       type: type ?? this.type,
//       name: name ?? this.name,
//     );
//   }

//   @override
//   List<Object?> get props => [id, type, name];

//   @override
//   bool get stringify => true;
//   factory GeneralType<T>.fromJson(
//     Map<String, dynamic> json,
//   ){
//     return GeneralType<T>(id: json['id'], type: T, name: json['name'])
//   }
// }
