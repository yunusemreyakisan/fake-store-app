import 'dart:async';

import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  //Increase count value
  void increment() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _count++;
        notifyListeners();
      },
    );
  }
}
