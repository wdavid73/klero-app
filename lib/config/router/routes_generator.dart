import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/ui/screens/screens.dart';
import 'package:klero_app/ui/screens/version_check/error_screen.dart';
import 'package:klero_app/ui/views/views.dart';

import 'routes_transitions.dart';

/// A utility class that defines the application's route paths and generates the
/// [GoRouter] route configuration.
///
/// This class provides constants for each route path and a method to generate
/// the list of [RouteBase] objects used by [GoRouter].
class AppRoutes {
  /// Generates the list of [RouteBase] objects for the application.
  ///
  /// This method defines the route hierarchy and associates each route path
  /// with its corresponding screen or view. It also defines nested routes
  /// for the widgets screen.
  ///
  /// Returns:
  ///   - A [List] of [RouteBase] objects representing the application's routes.
  static List<RouteBase> getAppRoutes() {
    return [
      /// SPLASH SCREEN
      GoRoute(
        path: RouteConstants.splash,
        name: "splash",
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),

      /// LOGIN ROUTE
      GoRoute(
        path: RouteConstants.loginScreen,
        name: "login",
        builder: (context, state) => const LoginScreen(),
      ),

      /// REGISTER ROUTE
      GoRoute(
        path: RouteConstants.registerScreen,
        name: "register",
        pageBuilder: (context, state) => _transitionPage(
          child: const RegisterScreen(),
          transitionType: TransitionType.slideRight,
        ),
      ),

      GoRoute(
        path: RouteConstants.checkingVersion,
        name: "checking_version_app",
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: RouteConstants.maintenanceApp,
        name: "maintenance_app",
        builder: (context, state) => MaintenanceScreen(),
      ),

      GoRoute(
        path: RouteConstants.errorCheckingVersion,
        name: "error_checking_version",
        builder: (context, state) => ErrorScreen(),
      ),

      /* ShellRoute(
        builder: _buildShell,
        routes: [ */
      /// HOME ROUTE
      GoRoute(
        path: RouteConstants.home,
        name: "home",
        builder: (context, state) => const HomeScreen(),
      ),

      /// SETTINGS ROUTE
      GoRoute(
        path: RouteConstants.settingsScreen,
        name: "settings",
        /*builder: (context, state) => const SettingsScreen(),*/
        pageBuilder: (_, __) => _transitionPage(
          child: const SettingsScreen(),
          transitionType: TransitionType.slideRight,
        ),
      ),

      /// CREATE TASK ROUTE
      GoRoute(
        path: "${RouteConstants.createTaskScreen}/:id",
        name: "task",
        pageBuilder: (context, state) => _transitionPage(
          child: TaskScreen(
            taskId: state.pathParameters['id'] ?? 'no-id',
          ),
          transitionType: TransitionType.slideRight,
        ),
      ),

      GoRoute(
        path: RouteConstants.accountDetails,
        name: "account_details",
        pageBuilder: (context, state) => _transitionPage(
          child: AccountDetails(),
          transitionType: TransitionType.slideRight,
        ),
      )

      /*   ),
        ], */
    ];
  }
}

/* Widget _buildShell(BuildContext context, GoRouterState state, Widget child) {
  return BlocProvider(
    lazy: false, // instance of NotificationsBloc,
    create: (_) => NotificationsBloc(
      requestLocalNotificationsPermissions:
          LocalNotifications.requestPermissionLocalNotification,
      showLocalNotification: LocalNotifications.showLocalNotification,
    ),
    child: child,
  );
} */

CustomTransitionPage<void> _transitionPage({
  required Widget child,
  TransitionType? transitionType,
}) =>
    TransitionManager.buildCustomTransitionPage(
      child,
      transitionType,
    );
