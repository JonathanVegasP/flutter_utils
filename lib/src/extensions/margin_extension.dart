import 'package:flutter/widgets.dart';

import 'build_context_extension.dart';
import 'media_query_data_extension.dart';

extension MarginExtension<T> on T {
  Widget verticalMargin() {
    return Builder(builder: (context) {
      return context.mediaQuery.verticalMargin;
    });
  }

  Widget horizontalMargin() {
    return Builder(builder: (context) {
      return context.mediaQuery.horizontalMargin;
    });
  }

  Widget dividerWidget() {
    return Builder(builder: (context) {
      return context.mediaQuery.divider;
    });
  }
}
