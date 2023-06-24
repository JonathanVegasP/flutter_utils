import 'package:flutter/material.dart';

import '../extensions/material_state_extensions.dart';

class TextFieldInputBorderTheme extends MaterialStateOutlineInputBorder {
  final Color color;
  final Color error;
  final BorderRadius radius;
  final bool isOutlined;

  const TextFieldInputBorderTheme({
    required this.color,
    required this.error,
    this.radius = const BorderRadius.all(Radius.circular(24.0)),
    this.isOutlined = true,
  });

  @override
  InputBorder resolve(Set<MaterialState> states) {
    final side = BorderSide(
      color: switch (states.isError) { true => error, _ => color },
      width: switch (states.hasAnyFocus) { true => 2, _ => 1 },
    );

    return switch (isOutlined) {
      true => OutlineInputBorder(borderSide: side, borderRadius: radius),
      _ => UnderlineInputBorder(borderSide: side)
    };
  }
}
