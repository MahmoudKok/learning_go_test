import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../configs/hive_configs/hive_type_ids.dart';
import '../../enums/user_auth.dart';

part 'user_information.g.dart';

UserInformation userInformationFromJson(String str) =>
    UserInformation.fromJson(json.decode(str));

String userInformationToJson(UserInformation data) =>
    json.encode(data.toJson());

@HiveType(typeId: HiveTypeIds.userInfoTypId)
@JsonSerializable()
class UserInformation extends Equatable {
  @HiveField(1)
  @JsonKey(name: "id")
  final int id;
  @HiveField(3)
  @JsonKey(name: "name")
  final String name;
  @HiveField(5)
  @JsonKey(name: "email")
  final String? email;
  @HiveField(7)
  @JsonKey(name: "email_verified_at")
  final String? emailVerifiedAt;
  @HiveField(9)
  @JsonKey(name: "token")
  final String token;
  @HiveField(11)
  @JsonKey(name: "role")
  final int? role;
  @HiveField(13)
  @JsonKey(name: "created_at")
  final String? createdAt;
  @HiveField(15)
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  const UserInformation({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.token,
    this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      _$UserInformationFromJson(json);

  Map<String, dynamic> toJson() => _$UserInformationToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      emailVerifiedAt,
      token,
      role,
      createdAt,
      updatedAt,
    ];
  }

  static UserInformation defaultValue = const UserInformation(
    token: '',
    emailVerifiedAt: "",
    updatedAt: "",
    role: -1,
    id: -1,
    createdAt: "",
    name: '',
    email: null,
  );

  UserInformation copyWith({
    int? id,
    String? name,
    String? email,
    String? emailVerifiedAt,
    String? token,
    ValueGetter<int?>? role,
    String? createdAt,
    String? updatedAt,
    UserAuth? userAuth,
  }) {
    return UserInformation(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      // token: token ?? this.token,
      role: role != null ? role() : this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,

      token: token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'UserInformation(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, token: $token, role: $role, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/**
 * 
 */
