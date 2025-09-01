import 'package:learning_go_test/generated/locale_keys.g.dart';
import 'package:learning_go_test/src/core/constants/messages/general_messages.dart';
import 'package:easy_localization/easy_localization.dart';

class AuthMessages extends GeneralMessages {
  String get numberAlreadyExist => LocaleKeys.this_number_is_already_exist.tr();

  String get userNameAlreadyExist => LocaleKeys.userNameAlreadyExist.tr();
}
