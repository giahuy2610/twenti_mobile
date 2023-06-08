import 'package:flutter/material.dart';

import '../models/account/account.dart';
import '../services/shared preferences/sharedPreferences.dart';

class GlobalProvider with ChangeNotifier {
  Account? account;

  bool _loginStatus = false;
  int? idcus = 1;
  String email = '';
  String phone = '';
  String name = '';

  bool get loginStatus => _loginStatus;

  void updateLoginStatus() {
    _loginStatus = true;
    //save login status to cache
    SharedPreferencesObject().saveLoginState(account!);

    notifyListeners();
  }
}
