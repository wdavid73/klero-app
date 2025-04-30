import 'package:flutter/material.dart';
import 'package:front_scaffold_flutter_v2/config/config.dart';

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