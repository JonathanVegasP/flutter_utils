import 'package:flutter/widgets.dart';

class Provider<T> extends InheritedWidget {
  const Provider({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final T data;

  static T of<T>(BuildContext context) {
    final Provider<T>? result =
        context.dependOnInheritedWidgetOfExactType<Provider<T>>();
    assert(result != null, 'No Provider<$T> found in context');
    return result!.data;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return data != oldWidget.data;
  }
}
