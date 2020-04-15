import 'package:flutter/material.dart';

class RootPageProvide with ChangeNotifier {
  int currentIndex=0;

  setCurrentIndex(int currentIndex) {
    this.currentIndex = currentIndex;
    notifyListeners();
  }
}
