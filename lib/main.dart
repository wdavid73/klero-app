import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front_scaffold_flutter_v2/app/app.dart';
import 'package:front_scaffold_flutter_v2/config/config.dart';
import 'package:front_scaffold_flutter_v2/ui/blocs/blocs.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

/// The main entry point of the Flutter application.
void main() async {
  // Ensures that Flutter bindings are initialized before running the app.
  WidgetsFlutterBinding.ensureInitialized();

  // Locks the app orientation to portrait mode.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /// Registers a background message handler for Firebase Messaging.
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  /// Initializes environment variables required for the app.
  await Environment.initEnvironment();

  /// Initializes Firebase with platform-specific configuration.
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationsBloc.initializeFirebase();

  /// Initializes the local notifications plugin.
  await LocalNotifications.initializeLocalNotifications();

  // Runs the main application widget.
  runApp(const MainApp());
}