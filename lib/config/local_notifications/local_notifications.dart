import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:front_scaffold_flutter_v2/config/config.dart';
// import 'package:go_router/go_router.dart';

/// Manages local notifications within the application.
///
/// This class provides methods to request notification permissions,
/// initialize the local notifications plugin, and display notifications.
class LocalNotifications {
  /// Requests the user for permission to display local notifications.
  ///
  /// This method is required on Android 13 (API level 33) and higher.
  /// In previous versions, the permission is automatically granted when installing the application.
  ///
  /// This method must be called before displaying any notification.
  ///
  /// Returns:
  ///   - A [Future] that completes when the permission request is finished.
  static Future<void> requestPermissionLocalNotification() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  /// Initializes the local notifications plugin.
  ///
  /// This method configures the initialization settings for Android and iOS.
  /// It also defines the behavior when receiving a notification response.
  ///
  /// This method should be called only once at the start of the application.
  ///
  /// Returns:
  ///   - A [Future] that completes when the initialization is finished.
  static Future<void> initializeLocalNotifications() async {
    final flutterLocalNotificationPlugins = FlutterLocalNotificationsPlugin();

    // Android settings.
    const initializationSettingsAndroid = AndroidInitializationSettings(
      'app_icon', // Replace 'app_icon' with the name of your icon in the 'drawable' folder.
    );

    // iOS settings.
    const initializationSettingsDarwin = DarwinInitializationSettings();

    // General settings for both platforms.
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    // Initializes the plugin with the settings and the callback for the response.
    await flutterLocalNotificationPlugins.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveLocalNotification,
    );
  }

  /// Shows a local notification.
  ///
  /// This method creates and displays a notification with the provided details.
  ///
  /// Parameters:
  ///   - [title]: Title of the notification.
  ///   - [body]: Body (message) of the notification.
  ///   - [data]: Additional data that can be sent with the notification.
  static void showLocalNotification({
    required String title,
    required String body,
    String? data,
  }) {
    // Unique identifier of the notification.
    final int id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    // Specific details for Android.
    const androidDetails = AndroidNotificationDetails(
      'channelId', // Replace 'channelId' with your channel ID.
      'channelName', // Replace 'channelName' with your channel name.
      importance: Importance.max,
      priority: Priority.high,
    );

    // Specific details for iOS.
    const iOSDetails = DarwinNotificationDetails(
      presentSound: true, // Enables sound for the notification.
    );

    // General details for both platforms.
    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iOSDetails,
    );

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Shows the notification.
    flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: data, // Additional data sent with the notification.
    );
  }

  static void _onDidReceiveLocalNotification(NotificationResponse response) {
    // Here you can add logic to handle the notification response,
    // for example, navigating to a specific screen.
    // navigatorKey.currentContext?.push('/widgets/text_styles_view');
  }
}