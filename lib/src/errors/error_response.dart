// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse extends Equatable {
  final int statusCode;
  final String message;

  const ErrorResponse({
    this.statusCode = 400,
    this.message = 'Unknown error occurred',
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      statusCode: json['status_code'] ?? 500,
      message: json['message'] ?? 'Unknown error occurred',
    );
  }

  @override
  List<Object> get props => [statusCode, message];
}
