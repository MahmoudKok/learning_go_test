// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:retrofit/error_logger.dart';
// import 'package:retrofit/http.dart';

// import '../../../../app/features/notifications/domain/entities/notification_entity.dart';
// import '../../Api/api_endpoints.dart';
// import '../../Api/api_response.dart';

// part 'notifications_api_services.g.dart';

// @LazySingleton()
// @RestApi()
// abstract class NotificationsApiServices {
//   @factoryMethod
//   factory NotificationsApiServices(
//     Dio dio, {
//     @Named('baseUrl') String baseUrl,
//   }) = _NotificationsApiServices;

//   // Create your APIs like:
//   @GET(ApiEndPoints.getUserNotifications)
//   Future<ApiResponse<List<NotificationEntity>>> getUserNotifications();
// }
