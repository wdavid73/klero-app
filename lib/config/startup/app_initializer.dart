import 'package:front_scaffold_flutter_v2/config/config.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

class AppInitializer {
  static Future<void> init() async {
    /// Initializes environment variables required for the app.
    await Environment.initEnvironment();

    /// Configures the HydratedBloc storage.
    final storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(
        (await getTemporaryDirectory()).path,
      ),
    );

    /// Sets the storage for HydratedBloc.
    HydratedBloc.storage = storage;

    /// You can add more initialization tasks here.
    /// Example: await Firebase.initializeApp();
    /// Example: await Hive.initFlutter();
    /// Example: await GetStorage.init();
  }
}