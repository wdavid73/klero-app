import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:front_scaffold_flutter_v2/ui/screens/screens.dart';
import 'package:front_scaffold_flutter_v2/ui/views/views.dart';
import 'routes_constants.dart';
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
      ///* SPLASH SCREEN
      GoRoute(
        path: RouteConstants.splash,
        name: "splash",
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),

      ///* HOME ROUTE
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

      /// ONBOARDING ROUTE
      GoRoute(
        path: RouteConstants.onboardingScreen,
        name: "onboarding",
        pageBuilder: (_, __) => _transitionPage(
          child: const OnBoardingScreen(),
          transitionType: TransitionType.fade,
        ),
      ),

      ///* WIDGET SCREEN
      GoRoute(
        path: RouteConstants.widgetsScreen,
        pageBuilder: (context, state) => _transitionPage(
          child: const WidgetsScreen(),
          transitionType: TransitionType.slideRight,
        ),
        routes: [
          GoRoute(
            path: RouteConstants.textStylesView,
            name: 'text_styles_view',
            builder: (context, state) => TextStylesView(),
          ),
          GoRoute(
            path: RouteConstants.inputsView,
            name: 'inputs_view',
            builder: (context, state) => InputsWidget(),
          ),
          GoRoute(
            path: RouteConstants.selectableWidgetView,
            name: 'selectable_widget_view',
            builder: (context, state) => SelectableWidgetView(),
          ),
          GoRoute(
            path: RouteConstants.drawerView,
            name: 'drawer_view',
            builder: (context, state) => DrawerView(),
          ),
          GoRoute(
            path: RouteConstants.buttonsView,
            name: 'buttons_view',
            builder: (context, state) => ButtonsView(),
          ),
          GoRoute(
            path: RouteConstants.bottomSheetView,
            name: 'bottom_sheet_view',
            builder: (context, state) => BottomSheetView(),
          ),
        ],
      ),

      GoRoute(
        path: RouteConstants.exampleService,
        builder: (context, state) => const ExampleServiceScreen(),
      ),

      ///* AUTH ROUTES
      GoRoute(
        path: RouteConstants.loginScreen,
        name: "login",
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteConstants.registerScreen,
        name: "register",
        builder: (context, state) => const RegisterScreen(),
      ),
    ];
  }
}

CustomTransitionPage<void> _transitionPage({
  required Widget child,
  TransitionType? transitionType,
}) =>
    TransitionManager.buildCustomTransitionPage(
      child,
      transitionType,
    );
