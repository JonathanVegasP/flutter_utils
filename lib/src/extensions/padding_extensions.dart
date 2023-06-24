import 'package:flutter/widgets.dart';

import 'build_context_extensions.dart';
import 'size_extensions.dart';

extension PaddingExt on Widget {
  Widget get verticalPadding {
    return Builder(builder: (context) {
      final screenSize = context.screenSize;
      return Padding(
        padding: screenSize.verticalPadding,
        child: this,
      );
    });
  }

  Widget get horizontalPadding {
    return Builder(builder: (context) {
      final screenSize = context.screenSize;
      return Padding(
        padding: screenSize.horizontalPadding,
        child: this,
      );
    });
  }

  Widget get padding {
    return Builder(builder: (context) {
      final screenSize = context.screenSize;
      return Padding(
        padding: screenSize.widgetPadding,
        child: this,
      );
    });
  }
}
