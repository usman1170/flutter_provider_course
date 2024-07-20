import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  DateTime _dateTime = DateTime.now();
  int _count = 0;
  int get count => _count;
  DateTime get dateTime => _dateTime;

  void setCount() {
    _count++;
    notifyListeners();
  }

  void time() {
    _dateTime = DateTime.now();
    notifyListeners();
  }
}
