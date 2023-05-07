import 'package:flutter/material.dart';

class GlobalProvider with ChangeNotifier {
  bool _loginStatus = false;

  bool get loginStatus => _loginStatus;

  void updateLoginStatus() {
    _loginStatus = true;
    notifyListeners();
  }
}
