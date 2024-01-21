import 'package:flutter/material.dart';

class NavigationViewModel extends ChangeNotifier {
  int _index = 0;
  String _page = "Home";
  set screenIndex(int val) {
    _index = val;
    notifyListeners();
  }

  set screenName(String name) {
    _page = name;
    notifyListeners();
  }

  int get screenIndex => _index;
  String get screenName => _page;
}
