import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart ' as tz;
import 'package:timezone/data/latest.dart' as tz1;

class NotificatonApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  // static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    // final bigPicture = await ImageDownloader.downloadImage(
    //   "https://data.whicdn.com/images/311920811/original.jpg",
    // );
    // final lIcon = await ImageDownloader.downloadImage(
    //   "https://wallpapercave.com/wp/wp7935579.jpg",
    // );
    // if (bigPicture != null && lIcon != null) {
    //   final styleInformation = BigPictureStyleInformation(
    //       FilePathAndroidBitmap(bigPicture),
    //       largeIcon: FilePathAndroidBitmap(lIcon));
    // }

    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'alarm_notif',
        'alarm_notif',
        icon: 'codex_logo',
        importance: Importance.max,
        sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
        largeIcon: DrawableResourceAndroidBitmap('codex_logo'),
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future init({bool initScheduled = false}) async {
    tz1.initializeTimeZones();
    final android = AndroidInitializationSettings("codex_logo");
    final ios = IOSInitializationSettings();
    final setting = InitializationSettings(android: android, iOS: ios);
    _notifications.initialize(
      setting,
      onSelectNotification: (payload) async {
        // onnotifications.add(payload);
      },
    );
  }

  static Future showNotification({
    id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    _notifications.show(
      id,
      title,
      body,
      await _notificationDetails(),
      payload: payLoad,
    );
  }

  // var time=
  static Future showScheduleNotification({
    id = 0,
    String? title,
    String? body,
    String? payLoad,
    required DateTime scheduleDate,
  }) async {
    _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduleDate, tz.local),
      await _notificationDetails(),
      payload: payLoad,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
