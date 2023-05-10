import 'package:flutter/material.dart';

import '../widgets/provider.dart';

extension BuildContextExt on BuildContext {
  T off<T>() => Provider.of(this);

  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);
}
