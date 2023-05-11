import 'package:flutter/material.dart';

import '../extensions/material_state_extensions.dart';

class TextFieldLabel extends MaterialStateTextStyle {
  final Color labelColor;
  final Color error;
  final double minFontSize;
  final double maxFontSize;

  const TextFieldLabel({
    required this.labelColor,
    required this.error,
    this.minFontSize = 11,
    this.maxFontSize = 14,
  });

  @override
  TextStyle resolve(Set<MaterialState> states) {
    final double fontSize;
    final FontWeight fontWeight;

    switch (states.hasAnyFocus) {
      case true:
        fontSize = minFontSize;
        fontWeight = FontWeight.w700;
      default:
        fontSize = maxFontSize;
        fontWeight = FontWeight.w500;
    }

    return TextStyle(
      color: switch (states.isError) { true => error, _ => labelColor },
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
