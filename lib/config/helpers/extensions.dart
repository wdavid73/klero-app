import 'package:flutter/material.dart';
import 'package:klero_app/config/config.dart';

/// Provides a convenient way to translate strings using the [BuildContext].
///
/// Adds a `translate` method to the [BuildContext] to easily access
/// localized strings via [AppLocalizations].
extension TranslateExtension on BuildContext {
  /// Translates a string using the provided [key].
  ///
  /// Uses [AppLocalizations] to perform the translation.
  ///
  /// Parameters:
  ///   - [key]: The key of the string to translate.
  ///
  /// Returns:
  ///   - The translated string.
  String translate(String key) {
    if (key != 'null') return AppLocalizations.of(this).translate(key);
    return '';
  }
}

extension GetLocale on BuildContext {
  String currentLocale() {
    return AppLocalizations.of(this).locale.toString();
  }
}

extension UnFocusScreen on BuildContext {
  void unfocus() {
    return FocusScope.of(this).unfocus();
  }
}
