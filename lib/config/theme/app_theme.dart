import 'package:flutter/material.dart';
import 'package:front_scaffold_flutter_v2/config/config.dart';
import 'package:front_scaffold_flutter_v2/config/theme/widget_themes/date_picker_theme.dart';
import './widget_themes/widget_themes.dart';

class AppTheme {
  static final ColorScheme _colorScheme = ColorScheme(
    brightness: Brightness.light,
    //? The primary color of the app.
    primary: ColorTheme.primaryColor,
    //? The color of text and icons on top of the primary color.
    onPrimary: ColorTheme.iconsColor,
    //? A lighter shade of the primary color, used for containers.
    primaryContainer: ColorTheme.lightPrimaryColor,
    //? The color of text and icons on top of the primary container color.
    onPrimaryContainer: ColorTheme.textPrimary,
    //? A secondary color for the app.
    secondary: ColorTheme.secondaryColor,
    //? The color of text and icons on top of the secondary color.
    onSecondary: ColorTheme.iconsColor,
    //? A lighter shade of the secondary color, used for containers.
    secondaryContainer: ColorTheme.lightPrimaryColor,
    //? The color of text and icons on top of the secondary container color.
    onSecondaryContainer: ColorTheme.textPrimary,
    //? An accent color for the app.
    tertiary: ColorTheme.accentColor,
    //? The color of text and icons on top of the tertiary color.
    onTertiary: ColorTheme.iconsColor,
    //? A lighter shade of the tertiary color, used for containers.
    tertiaryContainer: ColorTheme.lightPrimaryColor,
    //? A lighter shade of the tertiary color, used for text in containers.
    onTertiaryContainer: ColorTheme.textPrimary,
    //? The color of surfaces (background), such as cards and dialogs.
    surface: ColorTheme.backgroundColor,
    //? The color of text and icons on top of the surface color (onBackground).
    onSurface: ColorTheme.textPrimary,
    //? The color used for error states.
    error: ColorTheme.error,
    //? The color of text and icons on top of the error color.
    onError: ColorTheme.iconsColor,
    //? The color used for outlines, such as dividers.
    outline: ColorTheme.divider,

    //! Deprecated background: ColorTheme.backgroundColor, // The background color of the app.
    //! Deprecated onBackground: ColorTheme.textPrimary, // The color of text and icons on top of the background color.
  );

  static final ColorScheme _colorSchemeDark = _colorScheme.copyWith(
    brightness: Brightness.dark,
    surface: ColorTheme.backgroundColorDark,
    onSurface: ColorTheme.white,
  );

  /// Base IconThemeData. Used as a starting point for customizing the icon styles in both light and dark themes.
  static final _baseIconTheme = IconThemeData();

  /// Base AppBarTheme. Used as a starting point for customizing the app bar in both light and dark themes.
  static final _baseAppBarTheme = AppBarTheme(
    centerTitle: true,
    elevation: 5,
    iconTheme: _baseIconTheme.copyWith(color: ColorTheme.iconsColor),
    titleTextStyle:
        baseTextTheme.titleMedium?.copyWith(color: ColorTheme.white),
  );

  /// Base ChipThemeData. Used as a starting point for customizing the chip styles in both light and dark themes.
  static final _baseChipTheme = ChipThemeData(
    backgroundColor: ColorTheme.accentColor,
    labelStyle: baseTextTheme.bodyMedium,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    side: BorderSide(width: 1, color: ColorTheme.accentColor),
  );

  /// Base DividerThemeData. Used as a starting point for customizing the divider styles in both light and dark themes.
  /// The color is set to ColorTheme.divider to ensure consistency.
  static final _baseDividerTheme = DividerThemeData(
    color: ColorTheme.divider,
  );

  /// Base ListTileThemeData. Used as a starting point for customizing the list tile styles in both light and dark themes.
  static final _baseListTileTheme = ListTileThemeData(
    titleTextStyle: baseTextTheme.bodyLarge,
    subtitleTextStyle: baseTextTheme.bodySmall,
    textColor: ColorTheme.textPrimary,
    selectedTileColor: ColorTheme.accentColor,
    selectedColor: ColorTheme.white,
    iconColor: ColorTheme.secondaryColor,
  );

  /// Base CardTheme. Used as a starting point for customizing the card styles in both light and dark themes.
  /// The shape is set to a rounded rectangle with a 20-pixel border radius.
  static final _baseCardTheme = CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  /// Base FloatingActionButtonThemeData. Used as a starting point for customizing the floating action button styles in both light and dark themes.
  static final _baseFABTheme = FloatingActionButtonThemeData(
    backgroundColor: ColorTheme.accentColor,
    foregroundColor: ColorTheme.white,
    extendedTextStyle: baseTextTheme.bodyLarge,
    iconSize: 16,
    splashColor: ColorTheme.primaryColor,
  );

  /// Base DrawerThemeData. Used as a starting point for customizing the drawer styles in both light and dark themes.
  static final _baseDrawerTheme = DrawerThemeData(
    scrimColor: ColorTheme.backgroundColorDark.withValues(
      alpha: 0.5,
    ),
    endShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  /// Base SnackBarThemeData. Used as a starting point for customizing the snack bar styles in both light and dark themes.
  static final _baseSnackBarTheme = SnackBarThemeData(
    closeIconColor: ColorTheme.white,
    // showCloseIcon: true,
    // behavior: SnackBarBehavior.floating,
    insetPadding: const EdgeInsets.all(10),
    actionBackgroundColor: ColorTheme.accentColor,
    disabledActionBackgroundColor: ColorTheme.disable,
    disabledActionTextColor: ColorTheme.white,
    contentTextStyle: baseTextTheme.bodyLarge,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
  );

  /// Base ProgressIndicatorThemeData. Used as a starting point for customizing the progress indicator styles in both light and dark themes.
  static final _baseProgressIndicatorTheme = ProgressIndicatorThemeData();

  /// Base BottomSheetThemeData. Used as a starting point for customizing the bottom sheet styles in both light and dark themes.
  static final _baseBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: ColorTheme.backgroundColor,
    dragHandleColor: ColorTheme.backgroundColorDark,
    surfaceTintColor: ColorTheme.lightPrimaryColor,
    showDragHandle: true,
    dragHandleSize: Size(50, 5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    constraints: BoxConstraints(
      minHeight: 250,
      minWidth: 450,
    ),
  );

  /// Base SwitchThemeData. Used as a starting point for customizing the switch styles in both light and dark themes.
  static final _baseSwitchTheme = SwitchThemeData(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    thumbColor: _resolveColorWith(
      ColorTheme.white,
      ColorTheme.disable,
    ),
    trackColor: _resolveColorWith(
      ColorTheme.secondaryColor,
      ColorTheme.white,
    ),
  );

  /// Base RadioThemeData. Used as a starting point for customizing the radio button styles in both light and dark themes.
  static final _baseRadioTheme = RadioThemeData(
    fillColor: WidgetStatePropertyAll<Color>(
      ColorTheme.secondaryColor,
    ),
  );

  /// Base CheckboxThemeData. Used as a starting point for customizing the checkbox styles in both light and dark themes.
  static final _baseCheckboxTheme = CheckboxThemeData(
    fillColor: _resolveColorWith(
      ColorTheme.secondaryColor,
      ColorTheme.white,
    ),
    checkColor: _resolveColorWith(
      ColorTheme.white,
      Colors.transparent,
    ),
    side: BorderSide(width: 1.5),
  );

  /// Base BottomNavigationBar ThemeData. Used as a starting point for customizing the bottom navigation bar styles in both light and dark themes.
  static final _baseBottomNavigationBar = BottomNavigationBarThemeData(
    backgroundColor: ColorTheme.secondaryColor,
    selectedItemColor: Colors.white,
    selectedLabelStyle: baseTextTheme.labelMedium,
    unselectedItemColor: ColorTheme.lightPrimaryColor,
    unselectedLabelStyle: baseTextTheme.labelSmall,
    showUnselectedLabels: false,
  );

  /// Base NavigationRailThemeData. Used as a starting point for customizing the navigation rail styles in both light and dark themes.
  static final _baseNavigationRail = NavigationRailThemeData(
    backgroundColor: ColorTheme.secondaryColor,
    elevation: 2,
    labelType: NavigationRailLabelType.none,
    minWidth: 50,
    selectedIconTheme: _baseIconTheme.copyWith(
      color: ColorTheme.accentColor,
    ),
    unselectedIconTheme: _baseIconTheme.copyWith(
      color: ColorTheme.lightPrimaryColor,
    ),
    selectedLabelTextStyle: baseTextTheme.labelMedium,
    unselectedLabelTextStyle: baseTextTheme.labelSmall?.copyWith(
      color: ColorTheme.lightPrimaryColor,
    ),
    useIndicator: false,
  );

  ///
  static final _baseNavigationDrawer = NavigationDrawerThemeData(
    backgroundColor: ColorTheme.navigationBackgroundColorLight,
    surfaceTintColor: ColorTheme.secondaryColor,
    elevation: 5,
  );

  static ThemeData getTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        colorScheme: _colorScheme,
        fontFamily: AppTypography.fontFamily,
        iconTheme: _baseIconTheme.copyWith(
          color: ColorTheme.secondaryColor,
          size: context.dp(1.8),
        ),
        appBarTheme: _baseAppBarTheme.copyWith(
          backgroundColor: ColorTheme.secondaryColor,
          iconTheme: _baseIconTheme.copyWith(
            color: ColorTheme.white,
          ),
        ),
        cardTheme: _baseCardTheme.copyWith(
          color: ColorTheme.backgroundColor,
        ),
        dividerTheme: _baseDividerTheme,
        chipTheme: _baseChipTheme.copyWith(
          labelStyle: baseTextTheme.bodyMedium?.copyWith(
            color: ColorTheme.textPrimary,
          ),
        ),
        textTheme: baseTextTheme,
        elevatedButtonTheme: baseElevatedButtonTheme,
        textButtonTheme: baseTextButtonTheme,
        outlinedButtonTheme: baseOutlinedButtonTheme,
        filledButtonTheme: baseFilledButtonTheme,
        floatingActionButtonTheme: _baseFABTheme,
        drawerTheme: _baseDrawerTheme,
        listTileTheme: _baseListTileTheme,
        snackBarTheme: _baseSnackBarTheme,
        progressIndicatorTheme: _baseProgressIndicatorTheme,
        bottomSheetTheme: _baseBottomSheetTheme,
        switchTheme: _baseSwitchTheme.copyWith(
          padding: EdgeInsets.zero,
          trackOutlineWidth: WidgetStatePropertyAll<double>(1.5),
        ),
        radioTheme: _baseRadioTheme,
        checkboxTheme: _baseCheckboxTheme,
        inputDecorationTheme: baseInputDecorationTheme,
        datePickerTheme: baseDatePickerTheme,
        bottomNavigationBarTheme: _baseBottomNavigationBar,
        navigationRailTheme: _baseNavigationRail,
        navigationDrawerTheme: _baseNavigationDrawer.copyWith(
          iconTheme: WidgetStatePropertyAll(
            _baseIconTheme.copyWith(
              size: context.dp(1.8),
            ),
          ),
        ),
      );

  static ThemeData getDarkTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        colorScheme: _colorSchemeDark,
        fontFamily: AppTypography.fontFamily,
        appBarTheme: _baseAppBarTheme.copyWith(
          backgroundColor: ColorTheme.backgroundColorDark,
        ),
        iconTheme: _baseIconTheme.copyWith(
          color: ColorTheme.lightPrimaryColor,
          size: context.dp(1.8),
        ),
        cardTheme: _baseCardTheme.copyWith(
          color: ColorTheme.backgroundColorDark,
        ),
        dividerTheme: _baseDividerTheme,
        chipTheme: _baseChipTheme.copyWith(
          backgroundColor: ColorTheme.secondaryColor,
          side: BorderSide(color: ColorTheme.secondaryColor, width: 1),
        ),
        textTheme: baseTextThemeDark,
        elevatedButtonTheme: baseElevatedButtonTheme,
        textButtonTheme: baseTextButtonDarkTheme,
        outlinedButtonTheme: baseOutlinedButtonDarkTheme,
        filledButtonTheme: baseFilledButtonTheme,
        floatingActionButtonTheme: _baseFABTheme.copyWith(
          foregroundColor: ColorTheme.white,
        ),
        drawerTheme: _baseDrawerTheme.copyWith(
          backgroundColor: ColorTheme.backgroundColorDark,
          scrimColor: ColorTheme.lightPrimaryColor.withValues(alpha: 0.5),
        ),
        listTileTheme: _baseListTileTheme.copyWith(
          textColor: ColorTheme.white,
          iconColor: ColorTheme.lightPrimaryColor,
          titleTextStyle: baseTextThemeDark.labelLarge,
          subtitleTextStyle: baseTextThemeDark.labelSmall?.copyWith(
            fontSize: 10,
          ),
        ),
        snackBarTheme: _baseSnackBarTheme.copyWith(
          contentTextStyle: baseTextThemeDark.bodyLarge,
        ),
        progressIndicatorTheme: _baseProgressIndicatorTheme,
        bottomSheetTheme: _baseBottomSheetTheme.copyWith(
          backgroundColor: ColorTheme.backgroundColorDark,
          dragHandleColor: ColorTheme.white,
        ),
        switchTheme: _baseSwitchTheme.copyWith(
          trackColor: _resolveColorWith(
            ColorTheme.secondaryColor,
            ColorTheme.textSecondary,
          ),
          trackOutlineColor: WidgetStatePropertyAll<Color>(Colors.transparent),
        ),
        radioTheme: _baseRadioTheme.copyWith(
          fillColor: WidgetStatePropertyAll<Color>(
            ColorTheme.lightPrimaryColor,
          ),
        ),
        checkboxTheme: _baseCheckboxTheme.copyWith(
          fillColor: _resolveColorWith(
            ColorTheme.secondaryColor,
            Colors.transparent,
          ),
          checkColor: _resolveColorWith(
            ColorTheme.lightPrimaryColor,
            Colors.transparent,
          ),
          side: BorderSide(color: ColorTheme.white),
        ),
        inputDecorationTheme: baseInputDecorationDarkTheme,
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: baseInputDecorationDarkTheme,
        ),
        datePickerTheme: baseDatePickerDarkTheme,
        bottomNavigationBarTheme: _baseBottomNavigationBar.copyWith(
          backgroundColor: ColorTheme.navigationBackgroundColorDark,
        ),
        navigationRailTheme: _baseNavigationRail.copyWith(
          backgroundColor: ColorTheme.navigationBackgroundColorDark,
        ),
        navigationDrawerTheme: _baseNavigationDrawer.copyWith(
          backgroundColor: ColorTheme.navigationBackgroundColorDark,
          iconTheme: _resolveIconThemeDataWith(
            _baseIconTheme.copyWith(
              color: ColorTheme.primaryColor,
              size: context.dp(1.8),
            ),
            _baseIconTheme,
          ),
          labelTextStyle: _resolveTextStyleWith(
            baseTextThemeDark.labelLarge!.copyWith(
              color: ColorTheme.textPrimary,
            ),
            baseTextThemeDark.labelLarge!.copyWith(
              color: ColorTheme.lightPrimaryColor,
            ),
          ),
        ),
      );

  static WidgetStateProperty<Color?> _resolveColorWith(
    Color selectedColor,
    Color unselectedColor,
  ) {
    return WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return selectedColor;
        }
        return unselectedColor;
      },
    );
  }

  static WidgetStateProperty<TextStyle?> _resolveTextStyleWith(
    TextStyle selectedText,
    TextStyle unselectedText,
  ) {
    return WidgetStateProperty.resolveWith<TextStyle?>(
        (Set<WidgetState> states) {
      return states.contains(WidgetState.selected)
          ? selectedText
          : unselectedText;
    });
  }

  static WidgetStateProperty<IconThemeData?> _resolveIconThemeDataWith(
    IconThemeData selectedIcon,
    IconThemeData unselectedIcon,
  ) {
    return WidgetStateProperty.resolveWith<IconThemeData?>(
        (Set<WidgetState> states) {
      return states.contains(WidgetState.selected)
          ? selectedIcon
          : unselectedIcon;
    });
  }
}