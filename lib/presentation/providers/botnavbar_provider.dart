import 'package:flutter/material.dart';

class BotNavBarProvider extends ChangeNotifier {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _menuNavbar = [
    {
      "icon": Icons.home,
      "title": "Home",
    },
    {
      "icon": Icons.history,
      "title": "Transaksi",
    },
    {
      "icon": Icons.person,
      "title": "Profil",
    }
  ];

  int get currentIndex => _currentIndex;
  List<Map<String, dynamic>> get menuNavbar => _menuNavbar;

  void changeIndex(int currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }
}
