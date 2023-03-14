import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesObject {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  /*Local cache structure
  {

  }
   */

  Future<bool> saveLoginState(bool state) async {
    final prefs = await _prefs;
    await prefs.setBool('loginState', state).then((bool success) {
      return success;
    });
    return false;
  }
}
