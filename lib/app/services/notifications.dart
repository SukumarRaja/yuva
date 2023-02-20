import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// create an instance
FirebaseMessaging messaging = FirebaseMessaging.instance;
FlutterLocalNotificationsPlugin fltNotification =
    FlutterLocalNotificationsPlugin();
//notification settings
void initMessaging() {
  var androidInit =
      const AndroidInitializationSettings("@mipmap/ic_launcher"); //for logo
  var iosInit = const IOSInitializationSettings(
    defaultPresentAlert: true,
    defaultPresentBadge: true,
    defaultPresentSound: true,
  );
  var initSetting = InitializationSettings(android: androidInit, iOS: iosInit);
  fltNotification = FlutterLocalNotificationsPlugin();
  fltNotification.initialize(initSetting);
  var androidDetails = const AndroidNotificationDetails('1', 'channelName',
      enableVibration: true,
      enableLights: true,
      importance: Importance.high,
      playSound: true,
      priority: Priority.high,
      visibility: NotificationVisibility.public,
      // sound:  UriAndroidNotificationSound("assets/audio/van_taxi.mp3"),
      icon: '@mipmap/ic_launcher');
  var iosDetails = IOSNotificationDetails();
  var generalNotificationDetails =
      NotificationDetails(android: androidDetails, iOS: iosDetails);
  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        fltNotification.show(notification.hashCode, notification.title,
            notification.body, generalNotificationDetails,
            payload: 'Default_Sound');
      } else if (notification != null) {
        fltNotification.show(notification.hashCode, notification.title,
            notification.body, generalNotificationDetails,
            payload: 'Default_Sound');
      }
    },
    onDone: () {},
  );

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    try {
      // ignore: unnecessary_null_comparison
      print("data is ${message.data}");
      if (message.data != null || message.data.isNotEmpty) {
        debugPrint("new trip assigned");
      }
    } catch (e) {
      debugPrint("new trip assigned");
    }
  });
}
