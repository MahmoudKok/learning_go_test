import 'package:learning_go_test/src/core/Api/api_response.dart';
import 'package:learning_go_test/src/errors/error_response.dart';
import 'package:learning_go_test/src/errors/exceptions/app_exception.dart';
import 'package:learning_go_test/src/errors/failures/app_failures.dart';
import 'package:learning_go_test/src/logger/dev_logger.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

Future<Either<Failure, T>> safeCallApi<T>(
  Future<ApiResponse<T>> Function() apiCall,
) async {
  try {
    final response = await apiCall();
    if (response.status == true &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      return Right(response.data as T);
    } else {
      final errorModel = ErrorResponse(
        statusCode: response.statusCode ?? 500,
        message: response.message ?? 'Unknown error',
      );
      return Left(
        ServerFailure(errorResponse: errorModel),
      ); // Return Server Failure
    }
  } catch (e) {
    Dev.logLineWithTagError(
      tag: 'Proccess',
      message: 'SafeApiCall Request catch: ${e.runtimeType}',
      error: e,
    );

    return Left(_mapExceptionToFailure(e as Exception));
  }
}

Failure _mapExceptionToFailure(Exception e) {
  try {
    Dev.logLineWithTagError(
      tag: 'Proccess',
      message: ' Map Excptions of type ${e.runtimeType}',
      error: e,
    );
    if (e is DioException) {
      return _mapExceptionToFailure(e.error as Exception);
    } else if (e is BadRequestException) {
      return BadRequestFailure(errorResponse: e.errorResponse);
    } else if (e is UnauthorisedException) {
      return UnauthorisedFailure(errorResponse: e.errorResponse);
    } else if (e is NoInternetConnectionException) {
      return NoInternetConnectionFailure(errorResponse: e.errorResponse);
    } else if (e is ForbiddenException) {
      return ForbiddenFailure(errorResponse: e.errorResponse);
    } else if (e is NotFoundException) {
      return NotFoundFailure(errorResponse: e.errorResponse);
    } else if (e is ConflictException) {
      return ConflictFailure(errorResponse: e.errorResponse);
    } else if (e is ServerException) {
      return ServerFailure(errorResponse: e.errorResponse);
    } else if (e is ServiceUnavailableException) {
      return ServiceUnavailableFailure(errorResponse: e.errorResponse);
    } else if (e is UnknownException) {
      return UnknownFailure(errorResponse: e.errorResponse);
    } else if (e is ParsingException) {
      return ParsingFailure(errorResponse: e.errorResponse);
    } else if (e is UnprocessableException) {
      return UnprocessableFailure(errorResponse: e.errorResponse);
    } else if (e is PaymentRequiredException) {
      return PaymentRequiredFailure(errorResponse: e.errorResponse);
    } else {
      // Log the unexpected error and return an unknown failure
      Dev.logLineWithTagError(
        tag: 'Proccess',
        message: 'SafeApiCall got excption ${e.runtimeType}',
        error: e,
      );
      return const UnknownFailure(
        errorResponse: ErrorResponse(
          statusCode: 0,
          message: 'An unexpected error occurred',
        ),
      );
    }
  } catch (e) {
    Dev.logLineWithTagError(
      tag: 'Proccess',
      message: 'Catch error in map excptions',
      error: e,
    );
    return const UnknownFailure(
      errorResponse: ErrorResponse(
        statusCode: 0,
        message: 'An unexpected error occurred',
      ),
    );
  }
}
