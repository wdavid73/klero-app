import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/* import 'package:klero_app/api/api.dart'; */
import 'package:klero_app/data/data.dart';
import 'package:klero_app/data/datasources/firebase_auth_datasource.dart';
import 'package:klero_app/domain/repositories/repositories.dart';
import 'package:klero_app/domain/usecases/usecases.dart';
import 'package:klero_app/ui/blocs/blocs.dart';
import 'package:klero_app/ui/cubits/cubits.dart';
import 'package:klero_app/ui/shared/service/service.dart';

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
          /* ApiAuthDataSource(ApiClient.instance), */
          FirebaseAuthDataSource(FirebaseAuth.instance),
        ),
      ),

      /// Provides `AuthUseCase`, which contains authentication-related business logic.
      RepositoryProvider<AuthUseCase>(
        create: (context) => AuthUseCase(
          context.read<AuthRepository>(),
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

      BlocProvider<TaskBloc>(
        // Injects required dependencies automatically.
        create: (context) => TaskBloc(),
        lazy: false, // Lazy initialization of the bloc.
      ),

      BlocProvider<CreateTaskCubit>(
        create: (context) => CreateTaskCubit(
          taskBloc: context.read<TaskBloc>(),
        ),
        lazy: false,
      )
    ];
  }
}
