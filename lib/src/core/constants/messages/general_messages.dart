import 'package:learning_go_test/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class GeneralMessages {
  // Error Messages
  String get noInternetMessage => LocaleKeys.oops_no_internet
      .tr(); // Oops! No internet. Check your connection and try again.

  String get someThingWentWrong => LocaleKeys.something_happened_try_again
      .tr(); // Something went wrong, please try again later.

  String get unauthorizedMessage =>
      LocaleKeys.oops_unauthorized.tr(); // Oops! You're not authorized.

  String get internalServerErrorMessage => LocaleKeys
      .something_went_wrong_please_try_again_later
      .tr(); // Something went wrong on our end. Try again later.

  String get badRequestMessage => LocaleKeys.check_your_input
      .tr(); // Hmm... check your input, something’s not right.

  String get serviceUnavailableMessage => LocaleKeys
      .service_down_try_again_later
      .tr(); // Service is temporarily unavailable. Try again later.

  String get unknownErrorMessage =>
      LocaleKeys.something_unexpected_happened.tr();
  get notFoundMessage =>
      LocaleKeys.not_found_error.tr(); // Uh-oh! Something unexpected happened.
  get accountNotExist => LocaleKeys.account_not_exist
      .tr(); // Uh-oh! Something unexpected happened.
}
