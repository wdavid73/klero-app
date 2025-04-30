import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_scaffold_flutter_v2/api/api.dart';
import 'package:front_scaffold_flutter_v2/data/data.dart';
import 'package:front_scaffold_flutter_v2/domain/repositories/repositories.dart';
import 'package:front_scaffold_flutter_v2/domain/usecases/usecases.dart';
import 'package:front_scaffold_flutter_v2/ui/blocs/blocs.dart';
import 'package:front_scaffold_flutter_v2/ui/cubits/cubits.dart';
import 'package:front_scaffold_flutter_v2/ui/shared/service/service.dart';

class AppInjection {
  /// Builds and provides a list of `RepositoryProvider` instances.
  ///
  /// This function initializes all repositories and use cases required for the app,
  /// ensuring that they are available for dependency injection via `RepositoryProvider`.
  ///
  /// Returns:
  ///   - A `List<RepositoryProvider>` containing all repositories and use cases.
  static List<RepositoryProvider> repositories() {
    return [
      /// Provides the [AuthRepository] and its corresponding [AuthUseCase].
      ///
      /// The [AuthRepository] is implemented by [AuthRepositoryImpl] and
      /// depends on [ApiAuthDataSource] for data access.
      /// The [AuthUseCase] depends on the [AuthRepository] for its logic.
      RepositoryProvider<AuthRepository>(
        create: (_) => AuthRepositoryImpl(
          ApiAuthDataSource(ApiClient.instance),
        ),
      ),

      /// Provides `AuthUseCase`, which contains authentication-related business logic.
      RepositoryProvider<AuthUseCase>(
        create: (context) => AuthUseCase(
          context.read<AuthRepository>(),
        ),
      ),

      /// Provides `ProductsRepository`, which handles product-related operations.
      RepositoryProvider<ProductsRepository>(
        create: (_) => ProductsRepositoryImpl(
          ApiProductDataSource(ApiClient.instance),
        ),
      ),

      /// Provides `ProductsUseCase`, which contains business logic for managing products.
      RepositoryProvider<ProductsUseCase>(
        create: (context) => ProductsUseCase(
          context.read(),
        ),
      ),
    ];
  }

  /// Builds and provides a list of `BlocProvider` instances.
  ///
  /// This function initializes all the necessary BLoCs and Cubits used in the app,
  /// ensuring they are available for dependency injection via the `BlocProvider` widget.
  ///
  /// Returns:
  ///   - A `List<BlocProvider>` containing all the required blocs and cubits.
  static List<BlocProvider> blocs() {
    return [
      /// Provides the `SettingsCubit`, which manages the app's settings.
      BlocProvider<ThemeModeCubit>(create: (context) => ThemeModeCubit()),

      /// Provides the `IntroductionCubit`, which introduction screen
      BlocProvider<IntroductionCubit>(
        create: (context) => IntroductionCubit(
          KeyValueStorageServiceImpl(),
        ),
      ),

      /// Provides the `AuthBloc`, responsible for handling authentication logic.
      BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(
          context.read<AuthUseCase>(),
          KeyValueStorageServiceImpl(),
        ),
      ),

      /// Provides the `SignInFormCubit`, which manages the state of the sign-in form.
      BlocProvider<SignInFormCubit>(
        create: (context) => SignInFormCubit(
          authBloc: context.read<AuthBloc>(),
        ),
        lazy: false, // Lazy initialization of the cubit.
      ),

      /// Provides the `RegisterFormCubitCubit`, which manages the state of the register form.
      BlocProvider<RegisterFormCubit>(
        create: (context) => RegisterFormCubit(
          authBloc: context.read<AuthBloc>(),
        ),
        lazy: false,
      ),

      // EXAMPLE BLOC
      // Provides the `ProductsBloc`, which manages product-related state.
      BlocProvider<ProductsBloc>(
        create: (context) => ProductsBloc(
          context.read(), // Injects required dependencies automatically.
        ),
        lazy: false, // Lazy initialization of the bloc.
      ),
    ];
  }
}
