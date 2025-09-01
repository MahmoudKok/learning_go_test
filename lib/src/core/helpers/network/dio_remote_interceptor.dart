import 'package:learning_go_test/generated/locale_keys.g.dart';
import 'package:learning_go_test/src/core/services/local_storage.dart';
import 'package:learning_go_test/src/errors/error_response.dart';
import 'package:learning_go_test/src/errors/exceptions/app_exception.dart';
import 'package:learning_go_test/src/localization/app_languages.dart';
import 'package:learning_go_test/src/logger/dev_logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

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
    token = storageProvider.userinformation.token;

    Dev.logLine('Token  $token');
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
