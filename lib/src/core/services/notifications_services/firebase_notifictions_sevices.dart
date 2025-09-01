// // firebase_messaging_service.dart

// import 'dart:developer';

// import 'package:learning_go_test/src/core/services/notifications_services/notifications_services.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get_it/get_it.dart';

// import '../../../../firebase_options.dart';
// import '../../../errors/exceptions/app_exception.dart';
// import '../../../logger/dev_logger.dart';
// import '../../di/service_locator.dart';
// import '../../enums/notifications_type.dart';

// // Background message handler
// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   Dev.logLineWithTag(
//     tag: 'NOTIFICATIONS',
//     message: 'Handling a background message: ${message.messageId}',
//   );
//   WidgetsFlutterBinding.ensureInitialized();

//   try {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//   } catch (e) {
//     debugPrint(
//       '[ERROR]: Firebase initialization failed in background handler: $e',
//     );
//   }

//   final sl = GetIt.instance;

//   // Reinitialize GetIt in the background isolate if it's not already registered
//   if (!sl.isRegistered<NotificationService>()) {
//     sl.registerLazySingleton(() => NotificationService());
//   }
//   await sl<NotificationService>().initialize(true);

//   final sound = message.data['ring_tone'] ?? 'default';

//   if (message.data['title'] != null) {
//     final NotificationType type = _getNotificationType(
//       message.data['type'] ?? 'medicine',
//     );
//     Dev.logLineWithTag(
//       tag: 'NOTIFICATIONS',
//       message: 'Start showing bacground message with sound $sound',
//     );
//     sl<NotificationService>().showNotification(
//       type: type,
//       title: message.data['title'],
//       message: message.data['body'],
//       imageUrl: message.data['image'] ?? '', // Extract image URL
//       soundUrl: sound,
//     );
//   }
// }

// /// Function to handle the notification that opened the app when terminated
// Future<void> handleInitialMessage() async {
//   RemoteMessage? initialMessage = await FirebaseMessaging.instance
//       .getInitialMessage();
//   if (initialMessage != null) {
//     // Handle the notification payload
//     final NotificationType type = _getNotificationType(
//       initialMessage.data['type'] ?? 'general',
//     );

//     sl<NotificationService>().showNotification(
//       type: type,
//       title: initialMessage.data['title'],
//       message: initialMessage.data['body'],
//       imageUrl: initialMessage.data['image'] ?? '', // Extract the image URL
//       soundUrl: initialMessage.data['ring_tone'], // Extract the ring tone URL
//       // 'ringTones/level_up.mp3'
//     );
//   }
// }

// Future<void> setupFirebaseMessaging() async {
//   // Initialize Firebase Messaging
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );
//   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     // print('User granted permission');
//   } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//     // print('User granted provisional permission');
//   } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
//     // print('User denied permission');
//   }

//   // Set foreground notification options
//   messaging.setForegroundNotificationPresentationOptions(
//     sound: true,
//     alert: true,
//     badge: true,
//   );
//   // Handle foreground messages
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//     // Dev.logLineWithTag(
//     //   tag: 'NOTIFICATIONS',
//     //   message:
//     //       'Message received in foreground: ${message.notification?.title})}',
//     // );
//     Dev.logMapWithTag(
//       tag: 'NOTIFICATIONS',
//       message: 'Message received in foreground with data:',
//       map: message.toMap(),
//     );
//     final settings = await messaging.getNotificationSettings();
//     Dev.logLineWithTag(
//       tag: 'NOTIFICATIONS',
//       message: 'Message received in foreground: ${settings.toString()})}',
//     );

//     if (message.data['title'] != null) {
//       final NotificationType type = _getNotificationType(
//         message.data['type'] ?? 'medicine',
//       );
//       Dev.logLineWithTag(
//         tag: 'NOTIFICATIONS',
//         message: 'Message received in foreground Shoing local notification:',
//       );
//       sl<NotificationService>().showNotification(
//         type: type,
//         title: message.data['title'],
//         message: message.data['body'],
//         imageUrl: message.data['image'] ?? '', // Extract the image URL
//         soundUrl: message.data['ring_tone'], // Extract the ring tone URL
//       );
//     }
//   });

//   // Handle background messages
//   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

//   // Handle when the app is opened from a notification
//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     Dev.logLineWithTag(
//       tag: 'NOTIFICATIONS',
//       message: 'Message clicked in background: ${message.messageId}',
//     );

//     // Handle notification tap if needed
//     if (message.notification != null) {
//       sl<NotificationService>().handleNotificationClick(
//         message.data['payload'],
//       );
//     }
//   });
// }

// // Helper function to determine notification type from data
// NotificationType _getNotificationType(String type) {
//   switch (type) {
//     case 'general':
//       return NotificationType.general;
//     case 'reports':
//       return NotificationType.report;
//     case 'report':
//       return NotificationType.report;
//     case 'task':
//       return NotificationType.task;
//     default:
//       return NotificationType.nan;
//   }
// }

// class FireBaseTokenMangment {
//   // Un-Register the generated FCM token
//   static Future<void> deleteFCMToken() async {
//     try {
//       await FirebaseMessaging.instance.deleteToken();
//     } catch (e) {
//       Dev.logError('Faild to delete FCM token $e');
//       throw ServerException();
//     }
//   }

//   //Generate FCM token for User
//   static Future<String?> getFCMToken() async {
//     try {
//       log('Firebase: ${Firebase.apps.firstOrNull}');
//       final apns = await FirebaseMessaging.instance.getAPNSToken();
//       Dev.logValue('The APNS is $apns');
//       String? token = await FirebaseMessaging.instance.getToken();
//       log('FCM Token generated: $token');
//       return token;
//     } catch (e) {
//       log('Error generating FCM Token: $e');
//       return null;
//     }
//   }
// }

/*
 bash
curl -X POST -H "Authorization: Bearer ************************" \
-H "Content-Type: application/json" \
-d '{
  "message": {
    "token": "*****************************",
    "data": {
      "title": "نمر قادم",
      "body": "لك هوب اوعا النمر", 
      "type":"genral",
      "image":"https://assets.stickpng.com/images/5874d13b42e4d628738559f4.png"
    }
  }
}' https://fcm.googleapis.com/v1/projects/*************/messages:send

      // "ring_tone":"ringtone",
            "ring_tone":"ringtone",
*/
