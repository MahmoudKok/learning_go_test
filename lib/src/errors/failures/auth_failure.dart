import 'package:learning_go_test/src/errors/error_response.dart';
import 'package:learning_go_test/src/errors/failures/app_failures.dart';

class InvalidInfoFailure extends Failure {
  const InvalidInfoFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 400,
              message: 'Invalid Information',
            ),
      );
}

class JsonConvertFailure extends Failure {
  const JsonConvertFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 422,
              message: 'Invalid Information',
            ),
      );
}

class UserAlreadyExistFailure extends Failure {
  const UserAlreadyExistFailure({ErrorResponse? errorResponse})
    : super(
        errorResponse:
            errorResponse ??
            const ErrorResponse(
              statusCode: 402,
              message: ' User Already Exist',
            ),
      );
}
