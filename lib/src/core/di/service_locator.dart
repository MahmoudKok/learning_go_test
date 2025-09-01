import 'package:learning_go_test/src/core/Api/base_urls.dart';
import 'package:learning_go_test/src/core/di/service_locator.config.dart';
import 'package:learning_go_test/src/core/helpers/network/dio_remote_interceptor.dart';
import 'package:learning_go_test/src/core/services/local_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
// ignore: depend_on_referenced_packages
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

GetIt sl = GetIt.instance;

@module
abstract class ServiceLocator {
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @LazySingleton()
  Dio get dio => getDio();

  @lazySingleton
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();
  @Named('baseUrl')
  String get baseUrl => BaseUrls.baseUrl;
  @Named('weatherBaseUrl')
  String get weatherBaseUrl => BaseUrls.weatherBaseUrl;
}

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configurationDependencies() async {
  sl = $initGetIt(sl);
}

Dio getDio() {
  Dio dio = Dio();
  dio.interceptors.clear();
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ),
  );
  dio.interceptors.add(RemoteInterceptor(sl<LocalStorage>()));

  return dio;
}
