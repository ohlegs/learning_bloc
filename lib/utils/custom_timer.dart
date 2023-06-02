import 'dart:async';
import 'package:flutter/material.dart';

class CustomTimer {
  Timer? _timer;
  int _tick = 0;
  set tick(tick) {
    _tick = tick;
  }

  startTimer(Function callback) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _tick = timer.tick;
      print(_tick);
      callback(_tick);
    });
  }

  stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }
}
