import 'dart:async';
import 'package:flutter/material.dart';

class CustomTimer {
  Timer? _timer;

  startTimer(Function callback) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      print(timer.tick);
      callback(timer.tick);
    });
  }

  stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }
}
