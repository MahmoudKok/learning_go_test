import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../logger/dev_logger.dart';
import '../configs/dotenv_keys.dart';

class BaseUrls {
  static String baseUrl = '';
  static String networkImagebaseUrl = '';
  static init() {
    baseUrl = dotenv.get(DotenvKeys.baseUrl);
    Dev.logLine('mnor $baseUrl');
    networkImagebaseUrl = dotenv.get(DotenvKeys.imageBaseUrl);
  }
}
