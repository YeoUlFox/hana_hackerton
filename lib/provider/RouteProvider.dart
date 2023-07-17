import 'package:flutter/material.dart';

class RouteProvider extends ChangeNotifier {
  int _currentIndex = 2;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int _userPoint = 400;

  int get userPoint => _userPoint;

  void increasePoint(int value) {
    _userPoint += value;
    notifyListeners();
  }
}