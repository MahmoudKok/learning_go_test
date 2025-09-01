// import 'package:json_annotation/json_annotation.dart';
// part 'api_response.g.dart';

// @JsonSerializable(genericArgumentFactories: true)

import 'package:learning_go_test/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../logger/dev_logger.dart';

class ApiResponse<T> {
  ApiResponse(this.status, this.message, this.data, this.statusCode);

  ApiResponse.success({this.message, this.data})
    : status = true,
      statusCode = 200;

  ApiResponse.error({this.message, this.error, this.statusCode})
    : status = false,
      data = null;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    try {
      if (json['status'] == false) {
        return ApiResponse<T>.error(
          message: json['message'],
          error: json['data'],
          statusCode: json['status_code'],
        );
      } else {
        T data;
        data = fromJsonT(json['data']);
        return ApiResponse<T>.success(message: json['message'], data: data);
      }
    } catch (error, st) {
      Dev.logErrorWithStackTrace(error, st);
      return ApiResponse<T>.error(
        message: LocaleKeys.service_down_try_again_later.tr(),
        error: error,
        statusCode: json['status_code'],
      );
    }
  }
  final bool? status;
  final String? message;
  final T? data;
  dynamic error;
  int? statusCode = 200;
  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data,
    'error': error,
    'status_code': statusCode,
  };
  @override
  String toString() {
    return 'ApiResponse{status: $status, message: $message, data: $data, error: $error , statusCode: $statusCode}';
  }

  bool get hasSucceeded => status == true;

  bool get hasFailed => status == false || status == null;
}
