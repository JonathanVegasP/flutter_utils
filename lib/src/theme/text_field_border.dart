import 'package:flutter/material.dart';

import '../extensions/material_state_extension.dart';

typedef TextFieldBorderConstructor = InputBorder Function({
  required Color color,
  required Color error,
  BorderRadius radius,
});

class TextFieldOutlineBorder extends MaterialStateOutlineInputBorder {
  final Color color;
  final Color error;
  final BorderRadius radius;

  const TextFieldOutlineBorder({
    required this.color,
    required this.error,
    this.radius = const BorderRadius.all(Radius.circular(24.0)),
  });

  @override
  InputBorder resolve(Set<MaterialState> states) {
    BorderSide side = BorderSide(color: color, width: 1);

    if (states.hasAnyFocus) {
      side = side.copyWith(width: 2);
    }

    if (states.isError) {
      side = side.copyWith(color: error);
    }

    return OutlineInputBorder(borderRadius: radius, borderSide: side);
  }
}

class TextFieldUnderlineBorder extends MaterialStateUnderlineInputBorder {
  final Color color;
  final Color error;
  final BorderRadius radius;

  const TextFieldUnderlineBorder({
    required this.color,
    required this.error,
    this.radius = const BorderRadius.all(Radius.circular(24.0)),
  });

  @override
  InputBorder resolve(Set<MaterialState> states) {
    BorderSide side = BorderSide(color: color, width: 1);

    if (states.hasAnyFocus) {
      side = side.copyWith(width: 2);
    }

    if (states.isError) {
      side = side.copyWith(color: error);
    }

    return UnderlineInputBorder(borderSide: side, borderRadius: radius);
  }
}
