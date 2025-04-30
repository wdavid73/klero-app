import 'package:flutter/cupertino.dart';
import './locale/locale.dart';

/// Provides localized strings for the application.
///
/// Loads translations based on the current [Locale].
class AppLocalizations {
  /// The current locale.
  final Locale locale;

  /// The map of localized strings.
  Map<String, String> _localizedString = {};

  /// Creates an [AppLocalizations] instance.
  AppLocalizations(this.locale);

  /// Retrieves the [AppLocalizations] instance for the given [BuildContext].
  ///
  /// Returns a default instance with English locale if not found.
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations(const Locale('en'));
  }

  /// The delegate for [AppLocalizations].
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationDelegate();

  /// Loads the localized strings for the current [locale].
  Future<void> load() async {
    final translations = getTranslations(locale.languageCode);
    _localizedString = translations;
  }

  /// Translates a string using the given [key].
  ///
  /// Returns the key if no translation is found.
  String translate(String key) {
    return _localizedString[key] ?? key;
  }
}

/// The delegate for [AppLocalizations].
class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  /// Creates a [_AppLocalizationDelegate].
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['es', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final appLocalizations = AppLocalizations(locale);
    await appLocalizations.load();
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

/// The delegate for [CupertinoLocalizations].
class AppCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  @override
  bool isSupported(Locale locale) => ['es', 'en'].contains(locale.languageCode);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(
          covariant LocalizationsDelegate<CupertinoLocalizations> old) =>
      false;
}

/// Retrieves the translations for the given [languageCode].
///
/// Returns English translations by default.
Map<String, String> getTranslations(String languageCode) {
  switch (languageCode) {
    case 'es':
      return esMap;
    default:
      return enMap;
  }
}