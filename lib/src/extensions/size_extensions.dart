import 'package:flutter/material.dart';

extension SizeExt on Size {
  bool get isCompact => width < 600;

  bool get isMedium => width > 599;

  bool get isExpanded => width > 839;

  Widget get verticalMargin {
    return switch (isCompact) {
      true => const SizedBox(height: 16),
      _ => const SizedBox(height: 24)
    };
  }

  Widget get horizontalMargin {
    return switch (isCompact) {
      true => const SizedBox(width: 16),
      _ => const SizedBox(width: 24)
    };
  }

  Widget get divider {
    return switch (isCompact) {
      true => const Divider(thickness: 2, height: 18),
      _ => const Divider(thickness: 2, height: 26)
    };
  }

  EdgeInsetsGeometry get verticalPadding {
    return switch (isCompact) {
      true => const EdgeInsets.symmetric(vertical: 16),
      _ => const EdgeInsets.symmetric(vertical: 24)
    };
  }

  EdgeInsetsGeometry get horizontalPadding {
    return switch (isCompact) {
      true => const EdgeInsets.symmetric(horizontal: 16),
      _ => const EdgeInsets.symmetric(horizontal: 24)
    };
  }

  EdgeInsetsGeometry get widgetPadding {
    return switch (isCompact) {
      true => const EdgeInsets.all(16),
      _ => const EdgeInsets.all(24)
    };
  }
}
