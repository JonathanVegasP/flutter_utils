import 'package:flutter/widgets.dart';

import 'build_context_extension.dart';
import 'media_query_data_extension.dart';

extension PaddingExt on Widget {
  Padding all(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Padding only({
    double left = .0,
    double top = .0,
    double right = .0,
    double bottom = .0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }

  Padding symmetric({double vertical = .0, double horizontal = .0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

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
