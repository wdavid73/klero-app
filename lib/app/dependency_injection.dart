import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:klero_app/data/data.dart';
import 'package:klero_app/domain/repositories/repositories.dart';
import 'package:klero_app/domain/usecases/auth_usecases.dart';
import 'package:klero_app/domain/usecases/tasks_usecases.dart';
import 'package:klero_app/ui/blocs/blocs.dart';
import 'package:klero_app/ui/cubits/cubits.dart';
import 'package:klero_app/ui/shared/service/service.dart';

final GetIt getIt = GetIt.instance;

class AppDependencyInjection {
  static void init() {
    /// Repositories
    getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        FirebaseAuthDataSource(FirebaseAuth.instance),
      ),
    );

    getIt.registerLazySingleton<TasksRepository>(
      () => TasksRepositoryImpl(
        FirestoreTasksDatasource(FirebaseFirestore.instance),
      ),
    );

    /// UseCases
    getIt.registerLazySingleton<AuthUseCases>(
      () => AuthUseCases(
        getIt<AuthRepository>(),
      ),
    );

    getIt.registerLazySingleton<TasksUsecases>(
      () => TasksUsecases(
        getIt<TasksRepository>(),
      ),
    );

    /// Services
    getIt.registerLazySingleton<KeyValueStorageService>(
      () => KeyValueStorageServiceImpl(),
    );

    /// Cubits and BLoCs

    /// Singleton
    getIt.registerLazySingleton<ThemeModeCubit>(() => ThemeModeCubit());

    getIt.registerLazySingleton<AppVersionBloc>(() => AppVersionBloc());

    getIt.registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        getIt<AuthUseCases>(),
        getIt<KeyValueStorageService>(),
      ),
    );
    getIt.registerLazySingleton<TaskBloc>(
      () => TaskBloc(
        getIt<TasksUsecases>(),
      ),
    );

    /// Factory

    getIt.registerFactory<SignInFormCubit>(
      () => SignInFormCubit(
        authBloc: getIt<AuthBloc>(),
      ),
    );

    getIt.registerFactory<RegisterFormCubit>(
      () => RegisterFormCubit(
        authBloc: getIt<AuthBloc>(),
      ),
    );

    getIt.registerFactory<CreateTaskCubit>(
      () => CreateTaskCubit(
        taskBloc: getIt<TaskBloc>(),
      ),
    );
  }
}
