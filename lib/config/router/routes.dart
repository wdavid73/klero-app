import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_scaffold_flutter_v2/config/config.dart';
import 'package:front_scaffold_flutter_v2/ui/blocs/blocs.dart';
import 'package:front_scaffold_flutter_v2/ui/views/views.dart';
import 'package:go_router/go_router.dart';
import 'package:front_scaffold_flutter_v2/ui/screens/screens.dart';

/// A utility class that defines the application's route paths and generates the
/// [GoRouter] route configuration.
///
/// This class provides constants for each route path and a method to generate
/// the list of [RouteBase] objects used by [GoRouter].
class Routes {
  /// The path for the home screen.
  static const String home = '/';

  /// The path for the splash screen.
  static const String splash = '/splash';

  /// The path for the login screen.
  static const String loginScreen = '/login';

  /// The path for the registration screen.
  static const String registerScreen = '/register';

  // ----------- EXAMPLES ----------- //
  /// The path for the example service screen.
  static const String exampleService = '/example_service';

  /// The path for the widgets screen.
  static const String widgetsScreen = '/widgets';
  static const String textStylesView = '/text_styles_view';
  static const String inputsView = '/inputs_view';
  static const String selectableWidgetView = '/selectable_widget_view';
  static const String drawerView = '/drawer_view';
  static const String buttonsView = '/buttons_view';
  static const String bottomSheetView = '/bottom_sheet_view';

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
      ///* SPLASH SCREEN
      GoRoute(
        path: splash,
        builder: (_, __) => const CheckAuthStatusScreen(),
      ),

      ///* AUTH ROUTES
      GoRoute(
        path: loginScreen,
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: registerScreen,
        builder: (_, __) => const RegisterScreen(),
      ),

      /// Shell routes for authenticated users.
      ShellRoute(
        builder: _buildShell,
        routes: [
          ///* HOME ROUTE
          GoRoute(
            path: home,
            builder: (_, __) => const HomeScreen(),
          ),

          ///* WIDGET SCREEN
          GoRoute(
            path: widgetsScreen,
            builder: (_, __) => const WidgetsScreen(),
            routes: [
              GoRoute(
                path: textStylesView,
                name: 'text_styles_view',
                builder: (_, __) => TextStylesView(),
              ),
              GoRoute(
                path: inputsView,
                name: 'inputs_view',
                builder: (_, __) => InputsWidget(),
              ),
              GoRoute(
                path: selectableWidgetView,
                name: 'selectable_widget_view',
                builder: (_, __) => SelectableWidgetView(),
              ),
              GoRoute(
                path: drawerView,
                name: 'drawer_view',
                builder: (_, __) => DrawerView(),
              ),
              GoRoute(
                path: buttonsView,
                name: 'buttons_view',
                builder: (_, __) => ButtonsView(),
              ),
              GoRoute(
                path: bottomSheetView,
                name: 'bottom_sheet_view',
                builder: (_, __) => BottomSheetView(),
              ),
            ],
          ),

          GoRoute(
            path: exampleService,
            builder: (_, __) => const ExampleServiceScreen(),
          ),
        ],
      ),
    ];
  }
}

/// Provides the [NotificationsBloc] for managing local notifications.
///
/// This bloc uses the [LocalNotifications] class to request permissions
/// and show notifications.
Widget _buildShell(BuildContext context, GoRouterState state, Widget child) {
  return BlocProvider(
    lazy: false, // instance of NotificationsBloc
    create: (_) => NotificationsBloc(
      requestLocalNotificationsPermissions:
          LocalNotifications.requestPermissionLocalNotification,
      showLocalNotification: LocalNotifications.showLocalNotification,
    ),
    child: child,
  );
}