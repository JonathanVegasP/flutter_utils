import 'package:flutter/material.dart';

extension MediaQueryDataExt on MediaQueryData {
  bool get isCompact => size.width < 600;

  bool get isMedium => size.width > 599;

  bool get isExpanded => size.width > 839;

  Widget get verticalMargin {
    return isCompact ? const SizedBox(height: 16) : const SizedBox(height: 24);
  }

  Widget get horizontalMargin {
    return isCompact ? const SizedBox(width: 16) : const SizedBox(width: 24);
  }

  Widget get divider {
    return isCompact
        ? const Divider(thickness: 2, height: 18)
        : const Divider(thickness: 2, height: 26);
  }

  EdgeInsetsGeometry get verticalPadding {
    return isCompact
        ? const EdgeInsets.symmetric(vertical: 16)
        : const EdgeInsets.symmetric(vertical: 24);
  }

  EdgeInsetsGeometry get horizontalPadding {
    return isCompact
        ? const EdgeInsets.symmetric(horizontal: 16)
        : const EdgeInsets.symmetric(horizontal: 24);
  }

  EdgeInsetsGeometry get widgetPadding {
    return isCompact
        ? const EdgeInsets.symmetric(horizontal: 16)
        : const EdgeInsets.symmetric(horizontal: 24);
  }
}
