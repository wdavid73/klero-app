import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_scaffold_flutter_v2/config/config.dart';
import 'package:front_scaffold_flutter_v2/ui/blocs/blocs.dart';
import 'package:front_scaffold_flutter_v2/ui/cubits/cubits.dart';
import 'package:go_router/go_router.dart';
import 'multi_bloc_providers.dart';
import 'multi_repository_provider.dart';

/// The [GoRouter] instance used for navigation.
GoRouter? _router;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  ThemeMode _resolveThemeMode(BuildContext context) {
    return context.select(
      (ThemeModeCubit cubit) =>
          cubit.state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _AppScope(
      child: Builder(
        builder: (context) {
          final authBloc = context.read<AuthBloc>();

          // Initialize the router if it's null
          _router ??= createAppRouter(authBloc);

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _router,
            title: Environment.appName,
            theme: AppTheme.getTheme(context),
            darkTheme: AppTheme.getDarkTheme(context),
            themeMode: _resolveThemeMode(context),
            localizationsDelegates: LocaleConfig.localizationDelegate,
            supportedLocales: LocaleConfig.supportedLocales,
          );
        },
      ),
    );
  }
}

/// A wrapper widget that provides MultiRepositoryProvider and MultiBlocProvider.
///
/// This widget is used to wrap the main application widget and provide the
/// necessary repositories and BLoCs for the application.
class _AppScope extends StatelessWidget {
  final Widget child;
  const _AppScope({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: buildRepositories(),
      child: MultiBlocProvider(
        providers: buildBlocs(),
        child: child,
      ),
    );
  }
}