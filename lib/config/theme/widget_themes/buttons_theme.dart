import 'package:flutter/material.dart';
import '../theme.dart';
import 'widget_themes.dart';

/// Constants for buttons
// Definition of a common border radius for the buttons
final double _borderRadius = 12;

/// Base theme for ElevatedButton. Used as a starting point for customizing the button styles in both light and dark themes.
final baseElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: ColorTheme.secondaryColor, // Button background color
    foregroundColor: ColorTheme.white, // Button text color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
    ),
    elevation: 5, // Elevation to give the button a shadow effect
    textStyle: baseTextTheme.bodyMedium,
  ),
);

/// Base theme for TextButton. Similar to ElevatedButton, but with no background color and a more minimalist style.
final baseTextButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    textStyle: baseTextTheme.bodyMedium,
  ),
);

/// Base theme for TextButton in dark mode.
final baseTextButtonDarkTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    textStyle: baseTextTheme.bodyMedium,
    foregroundColor: ColorTheme.white,
  ),
);

/// Base theme for OutlinedButton. Similar to TextButton but with a border around it.
final baseOutlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    textStyle: baseTextTheme.bodyMedium,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
    ),
  ),
);

/// Base theme for OutlinedButton in dark mode.
final baseOutlinedButtonDarkTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    textStyle: baseTextTheme.bodyMedium,
    foregroundColor: ColorTheme.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        _borderRadius,
      ),
    ),
  ),
);

/// Base theme for FilledButton. Similar to ElevatedButton but with filled background and no shadow.
final baseFilledButtonTheme = FilledButtonThemeData(
  style: FilledButton.styleFrom(
    textStyle: baseTextTheme.bodyMedium,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
    ),
  ),
);

/// Base theme for IconButton. In this case, it doesn't specify any customization but can be extended.
final baseIconButtonTheme = IconButtonThemeData();