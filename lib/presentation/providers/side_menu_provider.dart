import 'package:flutter/material.dart';

class SideMenuProvider extends ChangeNotifier {
  int _currentIndex = 0;
  bool _isOpened = false;

  final List<Map<String, dynamic>> _sideMenu = [
    {
      "icon": Icons.home,
      "title": "Home",
    },
    {
      "icon": Icons.search,
      "title": "Search",
    },
    {
      "icon": Icons.favorite,
      "title": "Wishlist",
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
  bool get isOpened => _isOpened;

  int get currentIndex => _currentIndex;
  List<Map<String, dynamic>> get sideMenu => _sideMenu;

  void changeCurrentInde(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void changeIsOpened(bool isOpened) {
    _isOpened = isOpened;
    notifyListeners();
  }
}
