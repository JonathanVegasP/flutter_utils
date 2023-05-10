import 'package:flutter/widgets.dart';

import 'build_context_extensions.dart';
import 'media_query_data_extensions.dart';

extension PaddingExt on Widget {
  Widget get verticalPadding {
    return Builder(builder: (context) {
      final mediaQuery = context.mediaQuery;
      return Padding(
        padding: mediaQuery.verticalPadding,
        child: this,
      );
    });
  }

  Widget get horizontalPadding {
    return Builder(builder: (context) {
      final mediaQuery = context.mediaQuery;
      return Padding(
        padding: mediaQuery.horizontalPadding,
        child: this,
      );
    });
  }

  Widget get padding {
    return Builder(builder: (context) {
      final mediaQuery = context.mediaQuery;
      return Padding(
        padding: mediaQuery.widgetPadding,
        child: this,
      );
    });
  }
}
