import 'package:flutter/material.dart';

enum ExpandableType { forwarded, reversed }

enum ExpandableOrientation { vertical, horizontal }

class ExpandableWidget extends StatefulWidget {
  const ExpandableWidget({
    Key? key,
    required this.controller,
    this.type = ExpandableType.forwarded,
    this.orientation = ExpandableOrientation.vertical,
    this.maintainState = false,
    required this.alignment,
    required this.child,
  }) : super(key: key);

  final ValueNotifier<bool> controller;
  final ExpandableType type;
  final ExpandableOrientation orientation;
  final bool maintainState;
  final AlignmentGeometry alignment;
  final Widget child;

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );

  late final animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeIn,
  );

  void _listener() {
    final value = isActive;

    switch (value) {
      case true:
        controller.forward();
      default:
        controller.reverse();
    }
  }

  static void _fn() {}

  @override
  void setState([VoidCallback fn = _fn]) {
    super.setState(fn);
  }

  @override
  void initState() {
    super.initState();

    controller.addListener(setState);

    widget.controller.addListener(_listener);

    _init();
  }

  @override
  void didUpdateWidget(covariant ExpandableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.type != widget.type) {
      _init();
    }

    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_listener);

      widget.controller.addListener(_listener);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listener);
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: widget.alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: ExpandableChild(
          isVisible: isVisible,
          maintainState: widget.maintainState,
          child: widget.child,
        ),
      ),
    );
  }
}

// ignore: library_private_types_in_public_api
extension ExpandableWidgetExt on _ExpandableWidgetState {
  bool get isActive => switch (widget.type == ExpandableType.forwarded) {
        true => widget.controller.value,
        _ => !widget.controller.value
      };

  bool get isVisible {
    return switch (controller.isAnimating) { true => true, _ => isActive };
  }

  double? get heightFactor {
    return switch (widget.orientation == ExpandableOrientation.vertical) {
      true => animation.value,
      _ => null
    };
  }

  double? get widthFactor =>
      switch (widget.orientation == ExpandableOrientation.horizontal) {
        true => animation.value,
        _ => null
      };

  void _init() {
    switch (isActive) {
      case true:
        controller.value = 1.0;
      default:
        controller.value = 0.0;
    }
  }
}

class ExpandableChild extends StatefulWidget {
  final bool isVisible;
  final bool maintainState;
  final Widget child;

  const ExpandableChild({
    Key? key,
    required this.isVisible,
    required this.maintainState,
    required this.child,
  }) : super(key: key);

  @override
  State<ExpandableChild> createState() => _ExpandableChildState();
}

class _ExpandableChildState extends State<ExpandableChild> {
  late var child = Visibility(
    visible: widget.isVisible,
    maintainState: widget.maintainState,
    child: widget.child,
  );

  @override
  void didUpdateWidget(covariant ExpandableChild oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isVisible != widget.isVisible ||
        oldWidget.maintainState != widget.maintainState ||
        oldWidget.child != widget.child) {
      child = Visibility(
        visible: widget.isVisible,
        maintainState: widget.maintainState,
        child: widget.child,
      );
    }
  }

  @override
  Widget build(BuildContext context) => child;
}
