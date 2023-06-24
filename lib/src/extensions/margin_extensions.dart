import 'package:flutter/widgets.dart';

import 'build_context_extensions.dart';
import 'size_extensions.dart';

extension MarginExtension<T> on T {
  Widget verticalMargin() {
    return Builder(builder: (context) {
      return context.screenSize.verticalMargin;
    });
  }

  Widget horizontalMargin() {
    return Builder(builder: (context) {
      return context.screenSize.horizontalMargin;
    });
  }

  Widget dividerWidget() {
    return Builder(builder: (context) {
      return context.screenSize.divider;
    });
  }
}
