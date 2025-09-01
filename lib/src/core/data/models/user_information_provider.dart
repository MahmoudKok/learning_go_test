import 'package:learning_go_test/src/core/data/models/user_information.dart';
import 'package:learning_go_test/src/core/enums/user_auth.dart';
import 'package:learning_go_test/src/core/services/local_storage.dart';

import '../../di/service_locator.dart';

class UserInformationProvider {
  final UserInformation _userInformation = UserInformation.defaultValue;
  UserInformation get userInformation {
    switch (sl<LocalStorage>().userSettings.userAuth) {
      case UserAuth.unauthorized:
        return _userInformation;

      case UserAuth.authorized:
        return sl<LocalStorage>().userinformation;
    }
  }
}
