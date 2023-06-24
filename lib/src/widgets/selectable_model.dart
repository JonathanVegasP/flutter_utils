import 'package:flutter/widgets.dart';

typedef SelectableModelBuilder<T, R> = R Function(T data);

class _Node extends StatelessWidget {
  final Widget nextChild;
  final Widget child;

  const _Node({required this.nextChild, required this.child});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  StatelessElement createElement() {
    return _NodeElement(this);
  }
}

class _NodeElement extends StatelessElement {
  _NodeElement(_Node super.widget);

  @override
  Widget build() {
    return (widget as _Node).child;
  }
}

abstract class NodeWidget extends Widget {
  const NodeWidget({super.key});

  @override
  NodeWidgetElement createElement();
}

mixin NodeWidgetElement on Element {
  _NodeElement? _parent;

  @override
  void mount(Element? parent, Object? newSlot) {
    if (parent is _NodeElement) {
      _parent = parent;
    }

    super.mount(parent, newSlot);
  }

  @override
  void activate() {
    super.activate();
    visitAncestorElements((parent) {
      if (parent is _NodeElement) {
        _parent = parent;
      }

      return false;
    });
  }
}

class SelectableModel<T> extends NodeWidget implements InheritedWidget {
  final T model;
  final Widget? _child;

  const SelectableModel({super.key, required this.model, Widget? child})
      : _child = child;

  static R select<T, R>(
      BuildContext context, SelectableModelBuilder<T, R> builder) {
    return context.select<T, R>(builder);
  }

  static R? maybeSelect<T, R>(
      BuildContext context, SelectableModelBuilder<T, R> builder) {
    return context.maybeSelect<T, R>(builder);
  }

  static T of<T>(BuildContext context) {
    return context.watch<T>();
  }

  static T? maybeOf<T>(BuildContext context) {
    return context.maybeWatch<T>();
  }

  static T read<T>(BuildContext context) {
    return context.read<T>();
  }

  static T? maybeRead<T>(BuildContext context) {
    return context.maybeRead<T>();
  }

  @override
  bool updateShouldNotify(SelectableModel<T> oldWidget) {
    return true;
  }

  bool updateShouldNotifyDependent(bool Function(T data) validator) {
    return validator(model);
  }

  @override
  // ignore: library_private_types_in_public_api
  _SelectableModelElement<T> createElement() {
    return _SelectableModelElement<T>(this);
  }

  @override
  Widget get child => _child ?? const SizedBox.shrink();
}

class _SelectableModelElement<T> extends InheritedElement
    with NodeWidgetElement {
  _SelectableModelElement(SelectableModel<T> super.widget);

  @override
  void updateDependencies(Element dependent, Object? aspect) {
    setDependencies(dependent, aspect);
  }

  @override
  void notifyDependent(
      covariant SelectableModel<T> oldWidget, Element dependent) {
    final dependency = getDependencies(dependent) as bool Function(T data)?;

    if (dependency == null) return;

    if ((widget as SelectableModel<T>)
        .updateShouldNotifyDependent(dependency)) {
      dependent.didChangeDependencies();
    }
  }

  @override
  Widget build() {
    final parent = _parent;
    if (parent != null) {
      return (parent.widget as _Node).nextChild;
    }
    return super.build();
  }
}

extension SelectableModelExt on BuildContext {
  R select<T, R>(SelectableModelBuilder<T, R> builder) {
    final el = getElementForInheritedWidgetOfExactType<SelectableModel<T>>();

    assert(el != null, 'No SelectableModel<$T> found in context');

    final data = builder((el!.widget as SelectableModel<T>).model);

    dependOnInheritedElement(el, aspect: (newState) {
      final newData = builder(newState);

      return newData != data;
    });

    return data;
  }

  R? maybeSelect<T, R>(SelectableModelBuilder<T, R> builder) {
    final el = getElementForInheritedWidgetOfExactType<SelectableModel<T>>();

    if (el == null) return null;

    final data = builder((el.widget as SelectableModel<T>).model);

    dependOnInheritedElement(el, aspect: (newState) {
      final newData = builder(newState);

      return newData != data;
    });

    return data;
  }

  T watch<T>() {
    final el = getElementForInheritedWidgetOfExactType<SelectableModel<T>>();

    assert(el != null, 'No SelectableModel<$T> found in context');

    final data = (el!.widget as SelectableModel<T>).model;

    dependOnInheritedElement(el, aspect: (newData) {
      return newData != data || newData is Listenable;
    });

    return data;
  }

  T? maybeWatch<T>() {
    final el = getElementForInheritedWidgetOfExactType<SelectableModel<T>>();

    if (el == null) return null;

    final data = (el.widget as SelectableModel<T>).model;

    dependOnInheritedElement(el, aspect: (newData) {
      return newData != data || newData is Listenable;
    });

    return data;
  }

  T read<T>() {
    final el = getElementForInheritedWidgetOfExactType<SelectableModel<T>>();

    assert(el != null, 'No SelectableModel<$T> found in context');

    return (el!.widget as SelectableModel<T>).model;
  }

  T? maybeRead<T>() {
    final el = getElementForInheritedWidgetOfExactType<SelectableModel<T>>();

    if (el == null) return null;

    return (el.widget as SelectableModel<T>).model;
  }
}

class SelectableListenableModel<T extends Listenable> extends StatelessWidget
    implements NodeWidget {
  final T model;
  final Widget? child;

  const SelectableListenableModel({super.key, required this.model, this.child});

  @override
  Widget build(BuildContext context) {
    return child ?? const SizedBox.shrink();
  }

  @override
  // ignore: library_private_types_in_public_api
  _SelectableListenableModel<T> createElement() {
    return _SelectableListenableModel<T>(this);
  }
}

class _SelectableListenableModel<T extends Listenable> extends StatelessElement
    with NodeWidgetElement {
  _SelectableListenableModel(SelectableListenableModel<T> super.widget);

  T get model => (widget as SelectableListenableModel<T>).model;

  @override
  void mount(Element? parent, Object? newSlot) {
    super.mount(parent, newSlot);
    model.addListener(markNeedsBuild);
  }

  @override
  void update(covariant SelectableListenableModel<T> newWidget) {
    final currentModel = model;
    final newModel = newWidget.model;

    if (currentModel != newModel) {
      currentModel.removeListener(markNeedsBuild);
      newModel.addListener(markNeedsBuild);
    }

    super.update(newWidget);
  }

  @override
  Widget build() {
    final parent = _parent;

    return SelectableModel(
      model: model,
      child: switch (parent) {
        null => super.build(),
        _ => (parent.widget as _Node).nextChild
      },
    );
  }

  @override
  void unmount() {
    model.removeListener(markNeedsBuild);
    super.unmount();
  }
}

class ChildrenWidget extends StatelessWidget {
  final List<NodeWidget> children;
  final Widget child;

  const ChildrenWidget({
    Key? key,
    required this.children,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  StatelessElement createElement() {
    return _ChildrenWidgetElement(this);
  }
}

class _ChildrenWidgetElement extends StatelessElement {
  _ChildrenWidgetElement(ChildrenWidget super.widget);

  @override
  Widget build() {
    final children = (widget as ChildrenWidget).children.reversed;
    var node = (widget as ChildrenWidget).child;

    for (final child in children) {
      node = _Node(nextChild: node, child: child);
    }

    return node;
  }
}
