import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  final List<Map<String, String>> _splashData = [
    {
      "text": "Welcome to Wakuteka, Let's Shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We help people connect to our shop",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop",
      "image": "assets/images/splash_3.png"
    },
  ];
  int _currentPage = 0;

  List<Map<String, String>> get splashData => _splashData;
  int get currentPage => _currentPage;

  void changeCurrentPage(index) {
    _currentPage = index;
    notifyListeners();
  }
}
