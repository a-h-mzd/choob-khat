import 'package:flutter/material.dart';

class PayProvider extends ChangeNotifier {
  bool isEnded = false;
  bool success = false;

  void endedChange(bool newValue) {
    isEnded = newValue;
    notifyListeners();
  }

  void successChange(bool newValue) {
    success = newValue;
    notifyListeners();
  }
}
