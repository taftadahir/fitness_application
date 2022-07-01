import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  // TODO: Timer count
  int _count = 0;

  // TODO: This is the initial count used to calculate the percent of the timer
  int initialCount = 0;

  // TODO: Here are the timers used
  Timer? _timer;

  // TODO: Check if we need a timer for the count
  bool? isTimer;

  // count getter and setter
  int get count => _count;
  set count(int count) {
    if (count != _count) {
      _count = count;
      update();
    }
  }

  // TODO: Used to start the timer
  void startTimer() {
    if (isTimer != null && isTimer!) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_count > 0) {
          _count--;
        } else {
          _count = 0;
          cancelTimer();
        }
        update();
      });
    }
  }

  // Cancel timer
  void cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    // Reset the count
    _count = 0;
  }
}
