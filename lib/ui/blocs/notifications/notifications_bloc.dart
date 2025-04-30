import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

/// Handles the background message for Firebase Messaging.
///
/// This function is triggered when a notification is received while the
/// app is in the background. It initializes Firebase and allows custom logic
/// to be executed, such as handling the message data.
///
/// Parameters:
///   - [message]: The remote message received from Firebase.
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // Here you can add logic to handle the RemoteMessage message,
  // for example, navigating to a specific screen.
  // int productId = message['data']['product_id'];
  // navigatorKey.currentContext?.push('/products/$productId');
}

/// Manages notification events and state within the application.
///
/// This [Bloc] is responsible for handling Firebase Cloud Messaging (FCM)
/// notifications, managing notification permissions, listening for
/// foreground messages, and showing local notifications.
///
/// It provides methods to request notification permissions, retrieve
/// the FCM token, and process received messages.
///
/// Parameters:
///   - [requestLocalNotificationsPermissions]: A callback to request
///     local notification permissions.
///   - [showLocalNotification]: A callback to display a local notification.
///
/// Example Usage:
/// ```dart
/// BlocProvider(
///   create: (_) => NotificationsBloc(),
///   child: MyApp(),
/// );
/// ```
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  /// Instance of Firebase Messaging.
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  /// Callback to request local notification permissions.
  final Future<void> Function()? requestLocalNotificationsPermissions;

  /// Callback to show a local notification.
  final void Function({
    required String title,
    required String body,
    String? data,
  })? showLocalNotification;

  /// Creates an instance of [NotificationsBloc].
  NotificationsBloc({
    this.requestLocalNotificationsPermissions,
    this.showLocalNotification,
  }) : super(NotificationsState()) {
    on<NotificationStatusChanged>(_onNotificationStatusChanged);

    // Checks the initial notification permission status.
    _initialStatusCheck();

    // Listens for incoming foreground messages.
    _onForegroundMessage();
  }

  /// Initializes Firebase for the application.
  ///
  /// This method ensures that Firebase is properly configured before
  /// using any Firebase-related services.
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  /// Retrieves the Firebase Cloud Messaging (FCM) token.
  ///
  /// The FCM token is used to send targeted push notifications to
  /// a specific device. It is only retrieved if notifications are authorized.
  void _getFCMToken() async {
    if (state.status != AuthorizationStatus.authorized) return;
    // final token = await messaging.getToken();
    // print(token);
  }

  /// Handles the notification permission status change event.
  ///
  /// This method updates the bloc state with the new authorization status
  /// and retrieves the FCM token if permissions are granted.
  ///
  /// Parameters:
  ///   - [event]: The event containing the new notification authorization status.
  ///   - [emit]: The function to emit a new state.
  void _onNotificationStatusChanged(
    NotificationStatusChanged event,
    Emitter<NotificationsState> emit,
  ) {
    emit(state.copyWith(status: event.status));
    _getFCMToken();
  }

  /// Checks the initial notification permission status.
  ///
  /// This method retrieves the current notification settings and updates
  /// the bloc state accordingly. It also attempts to get the FCM token.
  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add(NotificationStatusChanged(settings.authorizationStatus));
    _getFCMToken();
  }

  /// Sets up a listener for incoming notifications while the app is in the foreground.
  ///
  /// When a notification is received while the app is open, it is processed
  /// using [handleRemoteMessage].
  void _onForegroundMessage() async {
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
  }

  /// Processes an incoming remote message.
  ///
  /// If the message contains a notification payload, it triggers the
  /// [showLocalNotification] callback to display a local notification.
  ///
  /// Parameters:
  ///   - [message]: The remote message received from Firebase.
  void handleRemoteMessage(RemoteMessage message) {
    if (message.notification == null) return;

    if (showLocalNotification != null) {
      showLocalNotification!(
        title: message.notification!.title ?? '',
        body: message.notification!.body ?? '',
        data: message.data.toString(),
      );
    }
  }

  /// Requests notification permissions from the user.
  ///
  /// This method prompts the user to grant permission for push notifications
  /// and updates the bloc state accordingly. It also requests permission
  /// for local notifications if the callback is provided.
  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (requestLocalNotificationsPermissions != null) {
      await requestLocalNotificationsPermissions!();
    }

    add(NotificationStatusChanged(settings.authorizationStatus));
  }
}