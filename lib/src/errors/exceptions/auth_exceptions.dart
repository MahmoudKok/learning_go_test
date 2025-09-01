import 'package:learning_go_test/src/errors/error_response.dart';
import 'package:learning_go_test/src/errors/exceptions/app_exception.dart';

class InvalidInfoException extends AppException {
  InvalidInfoException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 400,
              message: 'Invalid Information',
            ),
      );
}

class JsonConvertException extends AppException {
  JsonConvertException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 422,
              message: 'JSON Conversion Error',
            ),
      );
}

class UserAlreadyExistException extends AppException {
  UserAlreadyExistException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 409,
              message: 'User Already Exists',
            ),
      );
}

class ParsingException extends AppException {
  ParsingException({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(statusCode: 500, message: 'Parsing Error'),
      );
}
