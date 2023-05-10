import 'package:flutter/widgets.dart';

class ResizableSingleChildScrollView extends StatelessWidget {
  final Widget child;

  const ResizableSingleChildScrollView({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutBuilder(
        builder: (context, view) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: view.maxHeight),
            child: IntrinsicHeight(child: child),
          );
        },
      ),
    );
  }
}
