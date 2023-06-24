import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  Size get screenSize => MediaQuery.sizeOf(this);
}
