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
  TextFieldBorderConstructor textFieldBorderConstructor =
      TextFieldOutlineBorder.new,
  BorderRadius textFieldRadius = const BorderRadius.all(Radius.circular(24.0)),
  bool isTextFieldFilled = false,
  bool isTextFieldDense = false,
}) {
  final padding = textFieldBorderConstructor == TextFieldOutlineBorder.new
      ? const EdgeInsets.symmetric(horizontal: 8, vertical: 16)
      : const EdgeInsets.symmetric(vertical: 8);
  final border = textFieldBorderConstructor(
    color: primary,
    error: error,
    radius: textFieldRadius,
  );
  final label = TextFieldLabel(
    labelColor: primary,
    error: error,
  );
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
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        inherit: false,
        fontSize: 64,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displayMedium: TextStyle(
        inherit: false,
        fontSize: 56,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displaySmall: TextStyle(
        inherit: false,
        fontSize: 48,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      headlineLarge: TextStyle(
        inherit: false,
        fontSize: 40,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      headlineMedium: TextStyle(
        inherit: false,
        fontSize: 32,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      headlineSmall: TextStyle(
        inherit: false,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleLarge: TextStyle(
        inherit: false,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleMedium: TextStyle(
        inherit: false,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleSmall: TextStyle(
        inherit: false,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyLarge: TextStyle(
        inherit: false,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyMedium: TextStyle(
        inherit: false,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodySmall: TextStyle(
        inherit: false,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelLarge: TextStyle(
        inherit: false,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelMedium: TextStyle(
        inherit: false,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelSmall: TextStyle(
        inherit: false,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
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
    bottomAppBarTheme: BottomAppBarTheme(color: primary),
  );
}
