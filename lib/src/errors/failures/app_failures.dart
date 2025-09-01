import 'package:learning_go_test/src/errors/error_response.dart';
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final ErrorResponse errorResponse;

  const Failure({ErrorResponse? errorResponse})
    : errorResponse = errorResponse ?? const ErrorResponse();

  @override
  String toString() =>
      'Failure(message: ${errorResponse.message}, statusCode: ${errorResponse.statusCode})';

  @override
  List<Object> get props => [errorResponse];
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 400, message: 'Bad Request'),
      );
}

class UnauthorisedFailure extends Failure {
  const UnauthorisedFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 401, message: 'Unauthorized'),
      );
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 403, message: 'Forbidden'),
      );
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 404, message: 'Not Found'),
      );
}

class ConflictFailure extends Failure {
  const ConflictFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 409, message: 'Conflict'),
      );
}

class ServerFailure extends Failure {
  const ServerFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 500,
              message: 'Internal Server Error',
            ),
      );
}

class ServiceUnavailableFailure extends Failure {
  const ServiceUnavailableFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 503,
              message: 'Service Unavailable',
            ),
      );
}

class UnknownFailure extends Failure {
  const UnknownFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 520, message: 'Unknown Error'),
      );
}

class ParsingFailure extends Failure {
  const ParsingFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: -100, message: 'Parsing Error'),
      );
}

class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: -1,
              message: 'No Internet connection',
            ),
      );
}

class UnprocessableFailure extends Failure {
  const UnprocessableFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 422,
              message: 'Unprocessable Failure',
            ),
      );
}

class PaymentRequiredFailure extends Failure {
  const PaymentRequiredFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 402, message: 'Payment Required '),
      );
}

class CacheFailure extends Failure {
  const CacheFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: -400, message: 'Cache Excption '),
      );
}
