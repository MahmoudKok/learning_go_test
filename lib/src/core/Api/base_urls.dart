import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../logger/dev_logger.dart';
import '../configs/dotenv_keys.dart';

class BaseUrls {
  static String baseUrl = '';
  static String networkImagebaseUrl = '';
  static String weatherBaseUrl = '';
  static String weatherApiKey = '';
  static init() {
    baseUrl = dotenv.get(DotenvKeys.baseUrl);
    Dev.logLine('mnor $baseUrl');
    networkImagebaseUrl = dotenv.get(DotenvKeys.imageBaseUrl);
    weatherBaseUrl = dotenv.get(DotenvKeys.weatherBaseUrl);
    weatherApiKey = dotenv.get(DotenvKeys.weatherApiKey);
  }
}
