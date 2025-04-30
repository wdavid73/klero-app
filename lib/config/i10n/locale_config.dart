import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_localizations.dart';

/// Configures the app's localization settings.
///
/// Specifies the [LocalizationsDelegate]s and the supported [Locale]s.
abstract class LocaleConfig {
  /// The delegates used for localization.
  ///
  /// Includes delegates for [AppLocalizations], Material, Widgets, and Cupertino.
  static Iterable<LocalizationsDelegate<dynamic>> localizationDelegate = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    AppCupertinoLocalizationsDelegate(),
  ];

  /// The list of supported locales.
  ///
  /// Defines the languages and regions supported by the app.
  static const List<Locale> supportedLocales = [
    Locale('es', 'ES'),
    Locale('es'),
    Locale('en', 'US'),
  ];
}