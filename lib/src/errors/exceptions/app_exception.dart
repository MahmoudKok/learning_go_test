import 'package:learning_go_test/src/errors/error_response.dart';

class AppException implements Exception {
  final ErrorResponse errorResponse;

  AppException({ErrorResponse? errorResponse})
    : errorResponse = errorResponse ?? const ErrorResponse();

  @override
  String toString() {
    return 'Excption: ${errorResponse.message} (Code: ${errorResponse.statusCode})';
  }
}

class BadRequestException extends AppException {
  BadRequestException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 400, message: 'Bad Request'),
      );
}

class UnauthorisedException extends AppException {
  UnauthorisedException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 401, message: 'Unauthorized'),
      );
}

class ForbiddenException extends AppException {
  ForbiddenException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 403, message: 'Forbidden'),
      );
}

class NotFoundException extends AppException {
  NotFoundException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 404, message: 'Not Found'),
      );
}

class ConflictException extends AppException {
  ConflictException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 409, message: 'Conflict'),
      );
}

class ServerException extends AppException {
  ServerException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 500,
              message: 'Internal Server Error',
            ),
      );
}

class ServiceUnavailableException extends AppException {
  ServiceUnavailableException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 503,
              message: 'Service Unavailable',
            ),
      );
}

class UnknownException extends AppException {
  UnknownException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 520, message: 'Unknown Error'),
      );
}

class ParsingException extends AppException {
  ParsingException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 422, message: 'Parsing Error'),
      );
}

class NoInternetConnectionException extends AppException {
  NoInternetConnectionException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: -1,
              message: 'No Internet connection',
            ),
      );
}

class UnprocessableException extends AppException {
  UnprocessableException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 422,
              message: 'Unprocessable Exception',
            ),
      );
}

class PaymentRequiredException extends AppException {
  PaymentRequiredException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 402, message: 'Payment Required '),
      );
}

class CacheExcption extends AppException {
  CacheExcption({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: -400, message: 'Cache Excption '),
      );
}
