import 'package:flutter/material.dart';

extension MaterialStateSet on Set<MaterialState> {
  bool get isFocused => contains(MaterialState.focused);

  bool get isHovered => contains(MaterialState.hovered);

  bool get hasAnyFocus => any((element) => element.hasAnyFocus);

  bool get isError => contains(MaterialState.error);
}

extension MaterialStateExt on MaterialState {
  bool get isFocused => this == MaterialState.focused;

  bool get isHovered => this == MaterialState.hovered;

  bool get hasAnyFocus => isFocused || isHovered;

  bool get isError => this == MaterialState.error;
}
