import 'package:learning_go_test/src/core/constants/messages/auth_messages.dart';
import 'package:learning_go_test/src/core/constants/messages/general_messages.dart';
import 'package:learning_go_test/src/errors/failures/app_failures.dart';

extension FailureMessage on Failure {
  String getErrorMessage() {
    final messages = GeneralMessages();

    // You can match different failure types and return their corresponding message
    if (this is ServerFailure) {
      return messages.internalServerErrorMessage;
    } else if (this is BadRequestFailure) {
      return messages.badRequestMessage;
    } else if (this is UnauthorisedFailure) {
      return messages.unauthorizedMessage;
    } else if (this is NotFoundFailure) {
      return messages.notFoundMessage;
    } else if (this is ServiceUnavailableFailure) {
      return messages.serviceUnavailableMessage;
    } else if (this is UnknownFailure) {
      return messages.unknownErrorMessage;
    } else if (this is ParsingFailure) {
      return messages.someThingWentWrong;
    } else if (this is ConflictFailure) {
      return AuthMessages().userNameAlreadyExist;
    } else if (this is NoInternetConnectionFailure) {
      return messages.noInternetMessage;
    } else if (this is UnprocessableFailure) {
      return messages.badRequestMessage;
    } else if (this is PaymentRequiredFailure) {
      return messages.accountNotExist;
    } else {
      // Default message if the failure type is not specifically handled
      return messages.someThingWentWrong;
    }
  }
}
