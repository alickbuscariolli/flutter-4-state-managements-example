import 'package:flutter/material.dart';

class ValueNotifierStateManagement {
  final counter = ValueNotifier<int>(0);

  void incrementCounter() {
    counter.value++;
  }
}
