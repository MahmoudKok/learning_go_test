import 'package:learning_go_test/src/errors/exceptions/app_exception.dart';
import 'package:learning_go_test/src/errors/failures/app_failures.dart';

Failure mapExceptionToFailure(AppException exception) {
  if (exception is BadRequestException) {
    return const BadRequestFailure();
  } else if (exception is UnauthorisedException) {
    return const UnauthorisedFailure();
  } else if (exception is ForbiddenException) {
    return const ForbiddenFailure();
  } else if (exception is NotFoundException) {
    return const NotFoundFailure();
  } else if (exception is ConflictException) {
    return const ConflictFailure();
  } else if (exception is ServerException) {
    return const ServerFailure();
  } else if (exception is ServiceUnavailableException) {
    return const ServiceUnavailableFailure();
  } else if (exception is UnknownException) {
    return const UnknownFailure();
  } else if (exception is NoInternetConnectionException) {
    return const NoInternetConnectionFailure();
  } else {
    return const UnknownFailure();
  }
}

// Failure mapStatusCodeToFailure(int? statusCode, {String? message}) {
//   final generalMessages = GeneralMessages();

//   switch (statusCode) {
//     case 400:
//       return BadRequestFailure(message ?? generalMessages.badRequestMessage);
//     case 401:
//       return UnauthorisedFailure(
//           message ?? generalMessages.unauthorizedMessage);
//     case 403:
//       return ForbiddenFailure(message ??
//           generalMessages
//               .unauthorizedMessage); // Assuming "Forbidden" message would be similar
//     case 404:
//       return NotFoundFailure(message ??
//           generalMessages
//               .noInternetMessage); // Example assuming a not found message
//     case 409:
//       return ConflictFailure(message ??
//           generalMessages.serviceUnavailableMessage); // Replace as necessary
//     case 500:
//       return ServerFailure(
//           message ?? generalMessages.internalServerErrorMessage);
//     case 503:
//       return ServiceUnavailableFailure(
//           message ?? generalMessages.serviceUnavailableMessage);
//     case -100:
//       return ParsingFailure(message ?? generalMessages.unknownErrorMessage);
//     default:
//       return UnknownFailure(message ?? generalMessages.unknownErrorMessage);
//   }
// }
