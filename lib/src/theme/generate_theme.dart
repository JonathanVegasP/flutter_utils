import 'package:flutter/material.dart';

import 'text_field_border.dart';
import 'text_field_label.dart';

ThemeData generateTheme({
  Brightness brightness = Brightness.light,
  required Color primary,
  required Color secondary,
  required Color error,
  required Color surface,
  required Color background,
  required Color onBackground,
  BorderRadius textFieldRadius = const BorderRadius.all(Radius.circular(24.0)),
  bool isTextFieldFilled = false,
  bool isTextFieldDense = true,
  bool isTextFieldOutlined = true,
  Size minimumButtonSize = const Size(40, 40),
  Size maximumButtonSize = const Size(double.infinity, 40),
  OutlinedBorder buttonShape = const StadiumBorder(),
}) {
  final padding = isTextFieldOutlined
      ? const EdgeInsets.symmetric(horizontal: 8, vertical: 16)
      : const EdgeInsets.symmetric(vertical: 8);
  final border = TextFieldInputBorderTheme(
    color: primary,
    error: error,
    radius: textFieldRadius,
    isOutlined: isTextFieldOutlined,
  );
  final label = TextFieldLabel(
    labelColor: primary,
    error: error,
  );
  final appBarIconTheme = IconThemeData(color: surface);
  return ThemeData.from(
    colorScheme: ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: surface,
      secondary: secondary,
      onSecondary: surface,
      error: error,
      onError: surface,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onBackground,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        inherit: false,
        fontSize: 64,
        height: 1.125,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        color: onBackground,
      ),
      displayMedium: TextStyle(
        inherit: false,
        fontSize: 56,
        height: 1.1428,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        color: onBackground,
      ),
      displaySmall: TextStyle(
        inherit: false,
        fontSize: 48,
        height: 1.1666,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        color: onBackground,
      ),
      headlineLarge: TextStyle(
        inherit: false,
        fontSize: 40,
        height: 1.2,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        color: onBackground,
      ),
      headlineMedium: TextStyle(
        inherit: false,
        fontSize: 32,
        height: 1.25,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        color: onBackground,
      ),
      headlineSmall: TextStyle(
        inherit: false,
        fontSize: 24,
        height: 1.3333,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        color: onBackground,
      ),
      titleLarge: TextStyle(
        inherit: false,
        fontSize: 20,
        height: 1.2,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        color: onBackground,
      ),
      titleMedium: TextStyle(
        inherit: false,
        fontSize: 16,
        height: 1.50,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        color: onBackground,
      ),
      titleSmall: TextStyle(
        inherit: false,
        fontSize: 14,
        height: 1.5714,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        color: onBackground,
      ),
      bodyLarge: TextStyle(
        inherit: false,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        color: onBackground,
      ),
      bodyMedium: TextStyle(
        inherit: false,
        fontSize: 14,
        height: 1.5714,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        color: onBackground,
      ),
      bodySmall: TextStyle(
        inherit: false,
        fontSize: 12,
        height: 1.3333,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        color: onBackground,
      ),
      labelLarge: TextStyle(
        inherit: false,
        fontSize: 16,
        height: 1.50,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        color: onBackground,
      ),
      labelMedium: TextStyle(
        inherit: false,
        fontSize: 14,
        height: 1.5714,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        color: onBackground,
      ),
      labelSmall: TextStyle(
        inherit: false,
        fontSize: 12,
        height: 1.3333,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        color: onBackground,
      ),
    ),
  ).copyWith(
    inputDecorationTheme: InputDecorationTheme(
      border: border,
      filled: isTextFieldFilled,
      fillColor: surface,
      isDense: isTextFieldDense,
      contentPadding: padding,
      labelStyle: label,
      floatingLabelStyle: label,
    ),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    disabledColor: onBackground.withOpacity(0.12),
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      iconTheme: appBarIconTheme,
      actionsIconTheme: appBarIconTheme,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary,
      selectedItemColor: secondary,
      unselectedItemColor: surface,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: primary),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: minimumButtonSize,
        maximumSize: maximumButtonSize,
        shape: buttonShape,
        backgroundColor: primary,
        foregroundColor: surface,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: minimumButtonSize,
        maximumSize: maximumButtonSize,
        shape: buttonShape,
        backgroundColor: primary,
        foregroundColor: surface,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: minimumButtonSize,
        maximumSize: maximumButtonSize,
        shape: buttonShape,
        side: BorderSide(color: primary),
        foregroundColor: primary,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: minimumButtonSize,
        maximumSize: maximumButtonSize,
        foregroundColor: primary,
        shape: buttonShape,
      ),
    ),
  );
}
