import 'package:flutter/material.dart';

class ChangeNotifierStateManagement extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter += 1;
    notifyListeners();
  }
}
