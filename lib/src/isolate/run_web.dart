import 'dart:async';

Future<T> run<T>(FutureOr<T> Function() computation) async {
  await null;

  return computation();
}
