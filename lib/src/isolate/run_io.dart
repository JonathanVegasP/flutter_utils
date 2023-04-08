import 'dart:async';
import 'dart:isolate';

Future<T> run<T>(FutureOr<T> Function() computation) {
  return Isolate.run<T>(computation);
}
