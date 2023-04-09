import 'package:flutter/material.dart';

import '../extensions/material_state_extension.dart';

class TextFieldLabel extends MaterialStateTextStyle {
  final Color labelColor;
  final Color error;

  const TextFieldLabel({required this.labelColor, required this.error});

  @override
  TextStyle resolve(Set<MaterialState> states) {
    var style = TextStyle(
      color: labelColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );

    if (states.hasAnyFocus) {
      style = style.copyWith(fontSize: 11, fontWeight: FontWeight.w700);
    }

    if (states.isError) {
      style = style.copyWith(color: error);
    }

    return style;
  }
}
