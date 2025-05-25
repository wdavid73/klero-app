import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:klero_app/app/dependency_injection.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/ui/blocs/blocs.dart';
import 'package:klero_app/ui/cubits/cubits.dart';

/// The [GoRouter] instance used for navigation.
GoRouter? _router;

final _themeMode = getIt.get<ThemeModeCubit>();
final _appVersion = getIt.get<AppVersionBloc>();
final _authBloc = getIt<AuthBloc>();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    _appVersion.checkVersion();
    _router ??= createAppRouter(_authBloc, _appVersion);

    return BlocSelector<ThemeModeCubit, ThemeModeState, bool>(
      bloc: _themeMode,
      selector: (state) => state.isDarkMode,
      builder: (context, isDark) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
          title: Environment.appName,
          theme: AppTheme.getLightTheme(context),
          darkTheme: AppTheme.getDarkTheme(context),
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          localizationsDelegates: LocaleConfig.localizationDelegate,
          supportedLocales: LocaleConfig.supportedLocales,
        );
      },
    );
  }
}
