import 'package:flutter/material.dart';
import 'package:front_scaffold_flutter_v2/app/app.dart';
import 'package:front_scaffold_flutter_v2/config/config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Optional:  Locks the app orientation to portrait mode.
  // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);

  /// Initializes the app before running the main application.
  await AppInitializer.init();

  /// Runs the main application widget.
  runApp(const MainApp());
}
