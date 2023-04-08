import 'package:flutter/material.dart';

import '../extensions/material_state_extension.dart';

class TextFieldOutlineBorder extends MaterialStateOutlineInputBorder {
  final Color color;
  final Color error;

  const TextFieldOutlineBorder({required this.color, required this.error});

  @override
  InputBorder resolve(Set<MaterialState> states) {
    BorderSide side = BorderSide(color: color, width: 1);

    if (states.hasAnyFocus) {
      side = side.copyWith(width: 2);
    }

    if (states.isError) {
      side = side.copyWith(color: error);
    }

    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(24.0)),
      borderSide: side,
    );
  }
}

class TextFieldUnderlineBorder extends MaterialStateUnderlineInputBorder {
  final Color color;
  final Color error;

  const TextFieldUnderlineBorder({required this.color, required this.error});

  @override
  InputBorder resolve(Set<MaterialState> states) {
    BorderSide side = BorderSide(color: color, width: 1);

    if (states.hasAnyFocus) {
      side = side.copyWith(width: 2);
    }

    if (states.isError) {
      side = side.copyWith(color: error);
    }

    return UnderlineInputBorder(borderSide: side);
  }
}
