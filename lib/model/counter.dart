import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int get count => _count;
  List<int> get counts => _counts;

  int _count = 0;
  final List<int> _counts = [];

  void increment() {
    _count++;
    notifyListeners();
  }

  void append() {
    _counts.add(count);
    notifyListeners();
  }

  void clear() {
    _count = 0;
    _counts.clear();
    notifyListeners();
  }

  int calculateTotal() {
    return _counts.fold(0, (a, b) => a + b);
  }

  bool isTotalMultipleOfFive() => calculateTotal() % 5 == 0;
}
