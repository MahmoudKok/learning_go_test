// import 'dart:io' show Platform;
// import 'dart:typed_data';

// import 'package:dio/dio.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:injectable/injectable.dart';

// import '../../../logger/dev_logger.dart';
// import '../../enums/notifications_type.dart';
// import 'notifictions_constants.dart';

// @LazySingleton()
// class NotificationService {
//   static final FlutterLocalNotificationsPlugin
//       _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   FlutterLocalNotificationsPlugin get flutterLocalNotificationsPlugin =>
//       _flutterLocalNotificationsPlugin;
//   // Handle notification clicks (based on payload)
//   Future<void> handleNotificationClick(String? payload) async {
//     if (payload != null) {
//     //? For clickable notifications
//     }
//   }

//   // Initialize notification settings
//   Future<void> initialize(bool isBackground) async {
//     const DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//     );

//     if (!isBackground) {
//       // Check permission before requesting
//       await _flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()
//           ?.requestNotificationsPermission();
//     }

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('ic_notification');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );

//     // Initialize the plugin with the settings
//     _flutterLocalNotificationsPlugin.initialize(initializationSettings);

//     // Initialize Notification Channels
//     if (!isBackground) await _createNotificationChannels();

//     // Handle the initial message
//     // if (!isBackground)
//     // await _handleInitialMessage();
//   }

//   // Main function to show notifications based on type and group them
//   Future<void> showNotification({
//     required NotificationType type,
//     required String title,
//     required String message,
//     String? imageUrl,
//     String? soundUrl,
//     int? progress, // Optional for progress updates
//   }) async {
//     switch (type) {
//       case NotificationType.general:
//       case NotificationType.nan:
//         await _showGeneralGroupNotification(
//           title,
//           message,
//           imageUrl: imageUrl,
//           soundUrl: soundUrl,
//         );
//         break;
//       case NotificationType.report:
//         _showReportsGroupNotification(
//           title,
//           message,
//           imageUrl: imageUrl,
//           soundUrl: soundUrl,
//         );
//         break;
//       case NotificationType.task:
//         _showTasksGroupNotification(
//           title,
//           message,
//           imageUrl: imageUrl,
//           soundUrl: soundUrl,
//         );
//         break;
//       case NotificationType.progress:
//         if (progress != null) {
//           await _showProgressNotification(
//             title: title,
//             progress: progress,
//             message: message,
//           );
//         }
//         break;
//     }
//   }

//   Future<void> _showProgressNotification({
//     required String title,
//     required int progress,
//     String? message,
//   }) async {
//     const String uploadGroupKey =
//         'upload_progress_group_key'; // Group key for upload notifications

//     const int notificationId = 100;
//     if (progress >= 100) {
//       await _flutterLocalNotificationsPlugin.cancel(notificationId);
//       if (Platform.isIOS) {
//         return;
//       }
//     }
//     // Random().nextInt(
//     //   99,
//     // ) +
//     // 1; // Use a fixed ID for updates to the same notification

//     try {
//       final AndroidNotificationDetails androidDetails =
//           AndroidNotificationDetails(
//         'upload_channel', // Channel ID
//         'Upload Progress', // Channel name

//         importance: Importance.low, // Ensures no pop-up
//         priority: Priority.low, // Updates silently in the notification bar
//         groupKey: uploadGroupKey,
//         playSound: false,
//         showProgress: true,
//         maxProgress: 100,
//         progress: progress,
//         icon: 'ic_notification',
//         ongoing: true, // Prevents swiping away the notification
//       );

//       const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
//         sound: null,
//         threadIdentifier: uploadGroupKey,
//         interruptionLevel: InterruptionLevel.passive,
//         // Add these parameters for iOS
//         presentAlert: true,
//         presentBadge: true,
//         presentSound: false,
//         // This is crucial for updating existing notification
//         categoryIdentifier: 'upload_progress',
//       );

//       final NotificationDetails notificationDetails = NotificationDetails(
//         android: androidDetails,
//         iOS: iosDetails,
//       );
//       if (progress == 100) {
//         return;
//       }
//       await _flutterLocalNotificationsPlugin.show(
//         notificationId,
//         title,
//         //TODO:add locale keys if needed
//         message ?? "LocaleKeys.uploading.tr(args: ['$progress %'])",
//         notificationDetails,
//       );
//     } catch (e) {
//       // Handle errors gracefully
//       Dev.logError('Error showing progress notification: $e');
//     }
//   }

//   // Show order status notification, with optional image and grouping
//   void _showReportsGroupNotification(
//     String title,
//     String message, {
//     String? imageUrl,
//     String? soundUrl,
//   }) async {
//     final int notificationId =
//         DateTime.now().millisecondsSinceEpoch.remainder(100000);
//     const String reelGroupKey =
//         'reports_group_key'; // Group key for reel notifications

//     try {
//       AndroidNotificationDetails? androidDetails;
//       DarwinNotificationDetails? iosDetails;

//       // Configure Android notification details
//       if (imageUrl != null && imageUrl.isNotEmpty) {
//         final bitmap = await _downloadAndCreateBitmap(imageUrl);
//         final BigPictureStyleInformation bigPictureStyleInformation =
//             BigPictureStyleInformation(
//           bitmap,
//           contentTitle: title,
//           summaryText: message,
//         );

//         androidDetails = AndroidNotificationDetails(
//           NotificationConstants.reportsChannel.id +
//               DateTime.now().microsecondsSinceEpoch.toString(),
//           NotificationConstants.reportsChannel.name,
//           importance: NotificationConstants.reportsChannel.importanceLevel,
//           icon: 'ic_notification',
//           priority: NotificationConstants.reportsChannel.priority,
//           styleInformation: bigPictureStyleInformation,
//           groupKey: reelGroupKey,
//           playSound: true,
//           sound: soundUrl != null
//               ? RawResourceAndroidNotificationSound(soundUrl)
//               : null,
//         );
//       } else {
//         androidDetails = AndroidNotificationDetails(
//           NotificationConstants.reportsChannel.id +
//               DateTime.now().microsecondsSinceEpoch.toString(),
//           NotificationConstants.reportsChannel.name,
//           importance: NotificationConstants.reportsChannel.importanceLevel,
//           icon: 'ic_notification',
//           priority: NotificationConstants.reportsChannel.priority,
//           groupKey: reelGroupKey,
//           playSound: true,
//           sound: soundUrl != null
//               ? RawResourceAndroidNotificationSound(soundUrl)
//               : null,
//         );
//       }

//       // Configure iOS notification details
//       iosDetails = DarwinNotificationDetails(
//         sound:
//             soundUrl != null ? '$soundUrl.aiff' : null, // Add your custom sound
//         categoryIdentifier: reelGroupKey,
//       );

//       // Create NotificationDetails object for both platforms
//       final NotificationDetails notificationDetails = NotificationDetails(
//         android: androidDetails,
//         iOS: iosDetails,
//       );

//       // Show the notification
//       await _flutterLocalNotificationsPlugin.show(
//         notificationId,
//         title,
//         message,
//         notificationDetails,
//       );
//     } catch (e) {
//       // Fallback: Show notification without custom sound
//       AndroidNotificationDetails fallbackAndroidDetails =
//           AndroidNotificationDetails(
//         NotificationConstants.reportsChannel.id +
//             DateTime.now().microsecondsSinceEpoch.toString(),
//         NotificationConstants.reportsChannel.name,
//         importance: NotificationConstants.reportsChannel.importanceLevel,
//         icon: 'ic_notification',
//         priority: NotificationConstants.reportsChannel.priority,
//         groupKey: reelGroupKey,
//         playSound: true,
//       );
//       DarwinNotificationDetails iosfallbackDetails =
//           const DarwinNotificationDetails(
//         sound: null, // Add your custom sound
//         categoryIdentifier: reelGroupKey,
//       );

//       NotificationDetails fallbackNotificationDetails = NotificationDetails(
//         android: fallbackAndroidDetails,
//         iOS: iosfallbackDetails,
//       );

//       await _flutterLocalNotificationsPlugin.show(
//         notificationId,
//         title,
//         message,
//         fallbackNotificationDetails,
//       );
//     }
//   }

//   // Show order status notification, with optional image and grouping
//   void _showTasksGroupNotification(
//     String title,
//     String message, {
//     String? imageUrl,
//     String? soundUrl,
//   }) async {
//     final int notificationId =
//         DateTime.now().millisecondsSinceEpoch.remainder(100000);
//     const String tasksGroupKey =
//         'tasks_group_key'; // Group key for reel notifications

//     try {
//       AndroidNotificationDetails? androidDetails;
//       DarwinNotificationDetails? iosDetails;

//       // Configure Android notification details
//       if (imageUrl != null && imageUrl.isNotEmpty) {
//         final bitmap = await _downloadAndCreateBitmap(imageUrl);
//         final BigPictureStyleInformation bigPictureStyleInformation =
//             BigPictureStyleInformation(
//           bitmap,
//           contentTitle: title,
//           summaryText: message,
//         );

//         androidDetails = AndroidNotificationDetails(
//           NotificationConstants.tasksChannel.id +
//               DateTime.now().microsecondsSinceEpoch.toString(),
//           NotificationConstants.tasksChannel.name,
//           importance: NotificationConstants.tasksChannel.importanceLevel,
//           icon: 'ic_notification',
//           priority: NotificationConstants.tasksChannel.priority,
//           styleInformation: bigPictureStyleInformation,
//           groupKey: tasksGroupKey,
//           playSound: true,
//           sound: soundUrl != null
//               ? RawResourceAndroidNotificationSound(soundUrl)
//               : null,
//         );
//       } else {
//         androidDetails = AndroidNotificationDetails(
//           NotificationConstants.tasksChannel.id +
//               DateTime.now().microsecondsSinceEpoch.toString(),
//           NotificationConstants.tasksChannel.name,
//           importance: NotificationConstants.tasksChannel.importanceLevel,
//           icon: 'ic_notification',
//           priority: NotificationConstants.tasksChannel.priority,
//           groupKey: tasksGroupKey,
//           playSound: true,
//           sound: soundUrl != null
//               ? RawResourceAndroidNotificationSound(soundUrl)
//               : null,
//         );
//       }

//       // Configure iOS notification details
//       iosDetails = DarwinNotificationDetails(
//         sound:
//             soundUrl != null ? '$soundUrl.aiff' : null, // Add your custom sound
//         categoryIdentifier: tasksGroupKey,
//       );

//       // Create NotificationDetails object for both platforms
//       final NotificationDetails notificationDetails = NotificationDetails(
//         android: androidDetails,
//         iOS: iosDetails,
//       );

//       // Show the notification
//       await _flutterLocalNotificationsPlugin.show(
//         notificationId,
//         title,
//         message,
//         notificationDetails,
//       );
//     } catch (e) {
//       // Fallback: Show notification without custom sound
//       AndroidNotificationDetails fallbackAndroidDetails =
//           AndroidNotificationDetails(
//         NotificationConstants.tasksChannel.id +
//             DateTime.now().microsecondsSinceEpoch.toString(),
//         NotificationConstants.tasksChannel.name,
//         importance: NotificationConstants.tasksChannel.importanceLevel,
//         icon: 'ic_notification',
//         priority: NotificationConstants.tasksChannel.priority,
//         groupKey: tasksGroupKey,
//         playSound: true,
//         // setAsGroupSummary: true,
//       );
//       DarwinNotificationDetails iosfallbackDetails =
//           const DarwinNotificationDetails(
//         sound: null, // Add your custom sound
//         categoryIdentifier: tasksGroupKey,
//       );

//       NotificationDetails fallbackNotificationDetails = NotificationDetails(
//         android: fallbackAndroidDetails,
//         iOS: iosfallbackDetails,
//       );

//       await _flutterLocalNotificationsPlugin.show(
//         notificationId,
//         title,
//         message,
//         fallbackNotificationDetails,
//       );
//     }
//   }

//   // Create notification channels for general messages and order status updates

//   static Future<void> _createNotificationChannels() async {
//     if (Platform.isAndroid) {
//       final androidPlugin = _flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>();

//       if (androidPlugin != null) {
//         // Create the action channel
//         AndroidNotificationChannel generalChannel = AndroidNotificationChannel(
//           NotificationConstants.generalChannel.id +
//               DateTime.now().microsecondsSinceEpoch.toString(),
//           NotificationConstants.generalChannel.name,
//           description: NotificationConstants.generalChannel.description,
//           importance: NotificationConstants.generalChannel.importanceLevel,
//         );

//         await androidPlugin.createNotificationChannel(generalChannel);

//         // Create the reel channel
//         AndroidNotificationChannel reportsChannel = AndroidNotificationChannel(
//           NotificationConstants.reportsChannel.id +
//               DateTime.now().microsecondsSinceEpoch.toString(),
//           NotificationConstants.reportsChannel.name,
//           description: NotificationConstants.reportsChannel.description,
//           importance: NotificationConstants.reportsChannel.importanceLevel,
//         );

//         await androidPlugin.createNotificationChannel(reportsChannel);
//       } else {
//         Dev.logLineWithTag(
//           tag: 'NOTIFICATIONS',
//           message: 'AndroidFlutterLocalNotificationsPlugin is null',
//         );
//       }
//     } else {
//       Dev.logLineWithTag(
//         tag: 'NOTIFICATIONS',
//         message: 'Notification channels are not supported on iOS',
//       );
//     }
//   }

//   static Future<AndroidBitmap<Object>> _downloadAndCreateBitmap(
//     String imageUrl,
//   ) async {
//     try {
//       final dio = Dio();
//       final response = await dio.get<Uint8List>(
//         imageUrl,
//         options: Options(responseType: ResponseType.bytes),
//       );
//       final byteArray = response.data!;
//       return ByteArrayAndroidBitmap(byteArray) as AndroidBitmap<Object>;
//     } catch (e) {
//       Dev.logLineWithTagError(
//         tag: 'Notification',
//         message: 'Error downloading image',
//         error: e,
//       );
//       throw Exception('Failed to download image');
//     }
//   }

//   // Show general notification, with optional image and grouping
//   static Future<void> _showGeneralGroupNotification(
//     String title,
//     String message, {
//     String? imageUrl,
//     String? soundUrl,
//   }) async {
//     final int notificationId =
//         DateTime.now().millisecondsSinceEpoch.remainder(100000);

//     const String actionGroupKey =
//         'action_group_key'; // Shared group key for medicine, session, activity

//     try {
//       AndroidNotificationDetails? androidDetails;
//       DarwinNotificationDetails? iosDetails;

//       // Configure Android notification details
//       if (imageUrl != null && imageUrl.isNotEmpty) {
//         final bitmap = await _downloadAndCreateBitmap(imageUrl);
//         final BigPictureStyleInformation bigPictureStyleInformation =
//             BigPictureStyleInformation(
//           bitmap,
//           contentTitle: title,
//           summaryText: message,
//         );

//         androidDetails = AndroidNotificationDetails(
//           NotificationConstants.generalChannel.id +
//               DateTime.now().microsecondsSinceEpoch.toString(),
//           NotificationConstants.generalChannel.name,
//           importance: NotificationConstants.generalChannel.importanceLevel,
//           icon: 'ic_notification',
//           priority: NotificationConstants.generalChannel.priority,
//           styleInformation: bigPictureStyleInformation,
//           groupKey: actionGroupKey,
//           playSound: true,
//           sound: soundUrl != null
//               ? RawResourceAndroidNotificationSound(soundUrl)
//               : null,
//           // setAsGroupSummary: true,
//         );
//       } else {
//         androidDetails = AndroidNotificationDetails(
//           NotificationConstants.generalChannel.id +
//               DateTime.now().microsecondsSinceEpoch.toString(),
//           NotificationConstants.generalChannel.name,
//           importance: NotificationConstants.generalChannel.importanceLevel,
//           icon: 'ic_notification',
//           priority: NotificationConstants.generalChannel.priority,
//           groupKey: actionGroupKey,
//           playSound: true,
//           sound: soundUrl != null
//               ? RawResourceAndroidNotificationSound(soundUrl)
//               : null,
//         );
//       }

//       // Configure iOS notification details
//       iosDetails = DarwinNotificationDetails(
//         sound:
//             soundUrl != null ? '$soundUrl.wav' : null, // Add your custom sound
//         categoryIdentifier: actionGroupKey,
//       );

//       // Create NotificationDetails object for both platforms
//       final NotificationDetails notificationDetails = NotificationDetails(
//         android: androidDetails,
//         iOS: iosDetails,
//       );

//       // Show the notification
//       await _flutterLocalNotificationsPlugin.show(
//         notificationId,
//         title,
//         message,
//         notificationDetails,
//       );
//     } catch (e) {
//       // Log any errors
//       Dev.logLineWithTagError(
//         tag: 'NOTIFICATIONS',
//         message: 'Error while showing notification',
//         error: e,
//       );

//       // Fallback: Show notification without custom sound
//       AndroidNotificationDetails fallbackAndroidDetails =
//           AndroidNotificationDetails(
//         NotificationConstants.generalChannel.id +
//             DateTime.now().microsecondsSinceEpoch.toString(),
//         NotificationConstants.generalChannel.name,
//         importance: NotificationConstants.generalChannel.importanceLevel,
//         icon: 'ic_notification',
//         priority: NotificationConstants.generalChannel.priority,
//         groupKey: actionGroupKey,
//         playSound: true,
//       );
//       // Configure iOS notification details
//       DarwinNotificationDetails fallbackDetails =
//           const DarwinNotificationDetails(
//         sound: null, // Add your custom sound
//         categoryIdentifier: actionGroupKey,
//       );
//       NotificationDetails fallbackNotificationDetails = NotificationDetails(
//         android: fallbackAndroidDetails,
//         iOS: fallbackDetails,
//       );

//       await _flutterLocalNotificationsPlugin.show(
//         notificationId,
//         title,
//         message,
//         fallbackNotificationDetails,
//       );
//     }
//   }
// }
