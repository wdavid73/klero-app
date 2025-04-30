import 'package:flutter/material.dart';
import 'package:front_scaffold_flutter_v2/config/config.dart';
import 'text_theme.dart';

final _baseBorderSideInput = BorderSide(
  color: ColorTheme.backgroundColorDark,
  width: 1.5,
);
final _baseOutlineInputBorder = OutlineInputBorder(
  borderSide: _baseBorderSideInput,
  borderRadius: BorderRadius.circular(12),
);

/// Base InputDecorationTheme. Used as a starting point for customizing the input decoration styles in light.
final baseInputDecorationTheme = InputDecorationTheme(
  isDense: true,
  hintStyle: baseTextTheme.bodyLarge,
  labelStyle: baseTextTheme.labelLarge,
  floatingLabelStyle: baseTextTheme.labelLarge,
  helperStyle: baseTextTheme.bodySmall,
  errorStyle: baseTextTheme.bodySmall?.copyWith(color: ColorTheme.error),
  counterStyle: baseTextTheme.bodySmall,
  contentPadding: const EdgeInsets.all(8),
  suffixIconColor: ColorTheme.secondaryColor,
  enabledBorder: _baseOutlineInputBorder,
  disabledBorder: _baseOutlineInputBorder.copyWith(
    borderSide: _baseBorderSideInput.copyWith(
      color: ColorTheme.disable,
    ),
  ),
  focusedBorder: _baseOutlineInputBorder.copyWith(
    borderSide: _baseBorderSideInput.copyWith(
      color: ColorTheme.secondaryColor,
    ),
  ),
  errorBorder: _baseOutlineInputBorder.copyWith(
    borderSide: _baseBorderSideInput.copyWith(
      color: ColorTheme.error,
    ),
  ),
  focusedErrorBorder: _baseOutlineInputBorder.copyWith(
    borderSide: _baseBorderSideInput.copyWith(
      color: ColorTheme.error,
    ),
  ),
);

/// Base InputDecorationDarkTheme. Used as a starting point for customizing the input decoration styles in dark themes.
final baseInputDecorationDarkTheme = baseInputDecorationTheme.copyWith(
  hintStyle: baseTextThemeDark.bodyLarge,
  labelStyle: baseTextThemeDark.labelLarge,
  floatingLabelStyle: baseTextThemeDark.labelLarge,
  helperStyle: baseTextThemeDark.bodySmall,
  counterStyle: baseTextThemeDark.bodySmall,
  suffixIconColor: ColorTheme.lightPrimaryColor,
  prefixIconColor: ColorTheme.white,
  enabledBorder: _baseOutlineInputBorder.copyWith(
    borderSide: _baseBorderSideInput.copyWith(
      color: ColorTheme.lightPrimaryColor,
    ),
  ),
  focusedBorder: _baseOutlineInputBorder.copyWith(
    borderSide: _baseBorderSideInput.copyWith(
      color: ColorTheme.white,
    ),
  ),
  errorStyle: baseTextThemeDark.bodySmall?.copyWith(
    color: ColorTheme.error,
  ),
);