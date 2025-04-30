import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_scaffold_flutter_v2/domain/usecases/usecases.dart';
import 'package:front_scaffold_flutter_v2/ui/blocs/blocs.dart';
import 'package:front_scaffold_flutter_v2/ui/cubits/cubits.dart';
import 'package:front_scaffold_flutter_v2/ui/shared/service/service.dart';

/// Builds and returns a list of [BlocProvider] widgets.
///
/// This function is responsible for creating and configuring the different
/// [Bloc] and [Cubit] providers used throughout the application. Each
/// [BlocProvider] is configured with its respective dependencies and
/// instantiated with the necessary services or use cases.
///
/// Returns:
///   - A [List] of [BlocProvider] widgets.
List<BlocProvider> buildBlocs() {
  return [
    /// Provides the [AuthBloc] for managing authentication state.
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        context.read<AuthUseCase>(),
        KeyValueStorageServiceImpl(),
      ),
    ),

    /// Provides the [SignInFormCubit] for managing the sign-in form state.
    ///
    /// This cubit depends on the [AuthBloc] to handle authentication logic.
    BlocProvider<SignInFormCubit>(
      create: (context) => SignInFormCubit(
        authBloc: context.read<AuthBloc>(),
      ),
    ),

    /// Provides the [ProductsBloc] for managing product-related state.
    ///
    /// This bloc depends on a service or use case provided by the context.
    BlocProvider<ProductsBloc>(
      create: (context) => ProductsBloc(
        context.read(),
      ),
    ),
  ];
}