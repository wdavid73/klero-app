import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_scaffold_flutter_v2/ui/blocs/blocs.dart';
// import 'package:go_router/go_router.dart';

/// Handles notification interactions within the application.
///
/// This widget listens for notification interactions, ensuring that any
/// notification that opens the app is properly handled. It retrieves the
/// initial notification if the app was opened from a terminated state and
/// listens for new interactions while the app is running.
///
/// The [HandleNotificationInteractions] widget is designed to wrap the
/// application's main widget tree, ensuring that any notification-based
/// navigation or logic is executed properly.
///
/// Parameters:
///   - [child]: The main widget tree wrapped by this widget.
///
/// Example Usage:
/// ```dart
/// MaterialApp(
///   home: HandleNotificationInteractions(
///     child: MyHomePage(),
///   ),
/// );
/// ```
///
class HandleNotificationInteractions extends StatefulWidget {
  /// The child widget wrapped by this widget.
  final Widget child;

  /// Creates an instance of [HandleNotificationInteractions].
  const HandleNotificationInteractions({super.key, required this.child});

  @override
  State<HandleNotificationInteractions> createState() =>
      _HandleNotificationInteractionsState();
}

class _HandleNotificationInteractionsState
    extends State<HandleNotificationInteractions> {
  /// Sets up message interactions when the app starts.
  ///
  /// It retrieves the initial message if the app was opened from a
  /// notification in a terminated state and starts listening for
  /// new notification interactions.
  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  /// Handles incoming remote messages when a notification is tapped.
  ///
  /// This function processes the notification and triggers any necessary
  /// logic, such as navigation or state updates.
  ///
  /// Parameters:
  ///   - [message]: The remote message received from Firebase.
  void _handleMessage(RemoteMessage message) {
    context.read<NotificationsBloc>().handleRemoteMessage(message);

    /// Example:
    /// if (message.data["type"] == "example") {
    ///   context.push("/example");
    /// }
  }

  @override
  void initState() {
    setupInteractedMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}