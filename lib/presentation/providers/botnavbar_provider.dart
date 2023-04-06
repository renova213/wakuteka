import 'package:flutter/material.dart';

class BotNavBarProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeIndex(int currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }
}
