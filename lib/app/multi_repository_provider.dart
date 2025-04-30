import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_scaffold_flutter_v2/api/api.dart';
import 'package:front_scaffold_flutter_v2/data/data.dart';
import 'package:front_scaffold_flutter_v2/domain/repositories/repositories.dart';
import 'package:front_scaffold_flutter_v2/domain/usecases/usecases.dart';

/// Builds and returns a list of [RepositoryProvider] widgets.
///
/// This function is responsible for creating and configuring the different
/// [Repository] and [UseCase] providers used throughout the application.
/// Each [RepositoryProvider] is configured with its respective dependencies
/// and instantiated with the necessary data sources or other repositories.
///
/// Returns:
///   - A [List] of [RepositoryProvider] widgets.
List<RepositoryProvider> buildRepositories() {
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
    RepositoryProvider<AuthUseCase>(
      create: (context) => AuthUseCase(
        context.read<AuthRepository>(),
      ),
    ),

    /// Provides the [ProductsRepository] and its corresponding [ProductsUseCase].
    ///
    /// The [ProductsRepository] is implemented by [ProductsRepositoryImpl] and
    /// depends on [ApiProductDataSource] for data access.
    /// The [ProductsUseCase] depends on the [ProductsRepository] for its logic.
    RepositoryProvider<ProductsRepository>(
      create: (_) => ProductsRepositoryImpl(
        ApiProductDataSource(ApiClient.instance),
      ),
    ),
    RepositoryProvider<ProductsUseCase>(
      create: (context) => ProductsUseCase(
        context.read(),
      ),
    ),
  ];
}