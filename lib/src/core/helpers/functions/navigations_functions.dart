import 'package:learning_go_test/src/core/di/service_locator.dart';
import 'package:learning_go_test/src/core/services/local_storage.dart';

bool isUserAuthorized() {
  return sl<LocalStorage>().userinformation.token != '';
}
