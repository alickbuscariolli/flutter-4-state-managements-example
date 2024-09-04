import 'dart:async';

class StreamStateManagement {
  int _counter = 0;

  final _streamCtrl = StreamController<int>()..add(0);

  Stream<int> get counter => _streamCtrl.stream;

  void incrementCounter() async {
    _counter += 1;

    _streamCtrl.add(_counter);
  }
}
