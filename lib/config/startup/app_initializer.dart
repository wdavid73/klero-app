import 'package:firebase_core/firebase_core.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:klero_app/app/dependency_injection.dart';
import 'package:path_provider/path_provider.dart';

import 'firebase_options.dart';

class AppInitializer {
  static Future<void> init() async {
    /// Initializes environment variables required for the app.
    // await Environment.initEnvironment();

    /// Configures the HydratedBloc storage.
    final storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(
        (await getTemporaryDirectory()).path,
      ),
    );

    /// Sets the storage for HydratedBloc.
    HydratedBloc.storage = storage;

    /// Initialize firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    AppDependencyInjection.init();

    /// You can add more initialization tasks here.

    /// Example: await Hive.initFlutter();
    /// Example: await GetStorage.init();
  }
}
