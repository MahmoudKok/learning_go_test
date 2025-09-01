import 'dart:async';
import 'dart:ui';

import 'package:learning_go_test/generated/locale_keys.g.dart';
import 'package:learning_go_test/src/core/services/local_storage.dart';
import 'package:learning_go_test/src/core/services/secure_storage_servcies.dart';
import 'package:learning_go_test/src/errors/error_response.dart';
import 'package:learning_go_test/src/errors/exceptions/app_exception.dart';
import 'package:learning_go_test/src/localization/app_languages.dart';
import 'package:learning_go_test/src/logger/dev_logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../di/service_locator.dart';
import '../../enums/user_auth.dart';

class RemoteInterceptor extends Interceptor {
  final LocalStorage storageProvider;
  RemoteInterceptor(this.storageProvider);
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Dev.logLineWithTagError(tag: 'DIO', message: 'onErro Called', error: err);
    try {
      if (err.response != null) {
        final responseError = ErrorResponse(
          statusCode: err.response?.statusCode ?? 520,
          // message: err.response?.data['message'] ?? 'Unknown Error',
          message:
              err.response?.statusCode == 500 ||
                  err.response?.statusCode == 501 ||
                  err.response?.statusCode == 502
              ? LocaleKeys.something_went_wrong_please_try_again_later.tr()
              : err.response?.data['message'] ?? 'Unknown Error',
        );

        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(errorResponse: responseError);
          case 401:
            throw UnauthorisedException(errorResponse: responseError);
          case 402:
            throw PaymentRequiredException(errorResponse: responseError);
          case 403:
            throw ForbiddenException(errorResponse: responseError);
          case 404:
            throw NotFoundException(errorResponse: responseError);
          case 409:
            throw ConflictException(errorResponse: responseError);
          case 422:
            throw UnprocessableException(errorResponse: responseError);
          case 500:
            throw ServerException(errorResponse: responseError);
          case 503:
            throw ServiceUnavailableException(errorResponse: responseError);
          default:
            throw UnknownException(errorResponse: responseError);
        }
      } else {
        // If there's no response from the server, it could be a timeout or network issue
        if (err.type == DioExceptionType.connectionTimeout ||
            err.type == DioExceptionType.receiveTimeout) {
          throw UnknownException(
            errorResponse: const ErrorResponse(
              statusCode: 0,
              message: 'Connection timeout',
            ),
          );
        }
        throw UnknownException(
          errorResponse: const ErrorResponse(
            statusCode: 0,
            message: 'An unexpected error occurred',
          ),
        );
      }
    } catch (e) {
      Dev.logLineWithTagError(
        tag: 'Proccess',
        message: 'Dio On Error catch excption ${e.runtimeType}',
        error: e,
      );
      rethrow;
      // return super.onError(err, handler);
    }
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // super.onRequest(options, handler);
    final dioOption = options.copyWith(
      // baseUrl: BaseUrls.baseUrl,
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 50),
    );
    final headers = <String, String>{
      'Accept': 'application/json',

      // 'Content-Type':
      //     'application/json', // Ensure this is set to 'application/json'
    };
    if (storageProvider.userSettings.userAuth == UserAuth.unauthorized) {
      headers.addAll({'language': AppLanguages.curreentLocal.languageCode});
    }
    final customOptions = dioOption;
    customOptions.headers = headers;
    String? token;
    token = sl<SecureStorageServices>().token;

    // Dev.logLine('Token  $token');
    customOptions.headers['Authorization'] = 'Bearer $token';
    List<ConnectivityResult> connectivityResult = await Connectivity()
        .checkConnectivity();
    Dev.logList(connectivityResult, listName: 'Internet connections');
    if (connectivityResult.contains(ConnectivityResult.none)) {
      Dev.logLineWithTagError(tag: 'DIO', message: 'NO INTERNET CONNECTION');

      handler.reject(
        DioException(
          requestOptions: customOptions,
          // response: response,
          error: NoInternetConnectionException(
            errorResponse: ErrorResponse(
              statusCode: -1,
              message: LocaleKeys
                  .please_check_your_internet_connection_and_try_again_later
                  .tr(),
            ),
          ),
        ),
      );
      // throw NoInternetConnectionException();
    } else {
      return handler.next(customOptions);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      handler.next(response); // Proceed if response is successful
    } else {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: BadRequestException(
            errorResponse: ErrorResponse(
              statusCode: response.statusCode ?? 500,
              message: response.data['message'] ?? 'Dio unknown error',
            ),
          ),
        ),
      );
    }
  }
}

// interceptorLog(String message) => log('[INTERCEPTOR]=> $message');

class SimpleAuthInterceptor extends Interceptor {
  final Dio dio;
  final Dio refreshDio; // no interceptors
  final SecureStorageServices storage;
  final VoidCallback onLogout;

  Future<void>? _refreshing;

  SimpleAuthInterceptor({
    required this.dio,
    required this.refreshDio,
    required this.storage,
    required this.onLogout,
  });

  bool _isRefreshCall(RequestOptions o) => o.path.contains('/auth/refresh');

  Future<void> _setAuthHeader() async {
    final token = storage.token;
    if (token != null && token.isNotEmpty) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    } else {
      dio.options.headers.remove('Authorization');
    }
  }

  Future<void> _refreshToken() async {
    if (_refreshing != null) return _refreshing!;
    final c = Completer<void>();
    _refreshing = c.future;

    () async {
      try {
        final rt = storage.refreshToken;
        if (rt == null || rt.isEmpty) {
          throw Exception('No refresh token');
        }
        final resp = await refreshDio.post(
          '/auth/refresh',
          data: {'refreshToken': rt},
          options: Options(headers: {'Authorization': null}),
        );
        final newAccess = resp.data['access_token'] as String?;
        final newRefresh = (resp.data['refresh_token'] as String?) ?? rt;
        if (newAccess == null || newAccess.isEmpty) {
          throw Exception('Invalid refresh response');
        }
        await storage.saveTokens(
          accessToken: newAccess,
          refreshToken: newRefresh,
        );
        await _setAuthHeader();
        c.complete();
      } catch (e) {
        await storage.clear();
        onLogout();
        c.completeError(e);
      } finally {
        _refreshing = null;
      }
    }();

    return _refreshing!;
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    await _setAuthHeader();
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final is401 = err.response?.statusCode == 401;
    final req = err.requestOptions;

    if (is401 && !_isRefreshCall(req)) {
      try {
        await _refreshToken();

        final opts = Options(
          method: req.method,
          headers: req.headers,
          responseType: req.responseType,
          contentType: req.contentType,
          sendTimeout: req.sendTimeout,
          receiveTimeout: req.receiveTimeout,
          followRedirects: req.followRedirects,
          validateStatus: req.validateStatus,
        );

        final retry = await dio.request<dynamic>(
          req.path,
          data: req.data,
          queryParameters: req.queryParameters,
          options: opts,
          cancelToken: req.cancelToken,
          onReceiveProgress: req.onReceiveProgress,
          onSendProgress: req.onSendProgress,
        );
        handler.resolve(retry);
        return;
      } catch (_) {
        // refresh failed: session is cleared and logout fired by _refreshToken
        handler.next(err); // bubble up original 401
        return;
      }
    }

    handler.next(err);
  }
}
