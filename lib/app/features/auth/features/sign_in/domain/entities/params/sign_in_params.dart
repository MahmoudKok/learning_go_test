import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_params.g.dart';

@JsonSerializable()
class SignInParams extends Equatable {
  const SignInParams({required this.username, required this.password});

  final String username;
  final String password;

  SignInParams copyWith({String? username, String? password}) {
    return SignInParams(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  factory SignInParams.fromJson(Map<String, dynamic> json) =>
      _$SignInParamsFromJson(json);
  Map<String, dynamic> toJson() => _$SignInParamsToJson(this);

  @override
  List<Object?> get props => [username, password];
}
