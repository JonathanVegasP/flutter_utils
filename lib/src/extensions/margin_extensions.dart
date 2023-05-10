import 'package:flutter/widgets.dart';

import 'build_context_extensions.dart';
import 'media_query_data_extensions.dart';

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
