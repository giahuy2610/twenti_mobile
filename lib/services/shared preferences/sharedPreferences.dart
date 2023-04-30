import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesObject {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  /*Local cache structure
  {
    'searchingHistory' : List<String>['kem duong','mat na'],
    'loginState': bool true
  }
   */

  Future<bool> saveLoginState(bool state) async {
    final prefs = await _prefs;
    await prefs.setBool('loginState', state).then((bool success) {
      return success;
    });
    return false;
  }

  //Search history
  Future<bool> saveSearchingHistory(String value) async {
    final prefs = await _prefs;
    //get current list
    List<String> searchingHistory = <String>[];
    List<String>? currList = await prefs.getStringList("searchingHistory");
    print("loading local data storage");
    print(currList);
    if (currList != null) searchingHistory = currList;
    //add the new value to tail of list, remove the oldest value added if the length of list > 10
    searchingHistory.add(value);
    searchingHistory = [
      ...{...searchingHistory}
    ];
    if (searchingHistory.length > 10) searchingHistory.removeAt(0);
    await prefs
        .setStringList('searchingHistory', searchingHistory)
        .then((bool success) {
      return success;
    }).onError((error, stackTrace) => throw error!);
    return false;
  }

  Future<bool> clearSearchingHistory() async {
    final prefs = await _prefs;
    return await prefs.remove("searchingHistory");
  }

  Future<List<String>?> futureGetSearchingHistory() async {
    final prefs = await _prefs;
    return await prefs.getStringList("searchingHistory");
  }

  Future<bool> saveViewProductHistory(int productId) async {
    final prefs = await _prefs;
    //get current list
    List<String> viewHistory = <String>[];
    List<String>? currList = await prefs.getStringList("viewProductHistory");
    print("loading local data storage");
    print(currList);
    if (currList != null) viewHistory = currList;
    //add the new value to tail of list, remove the oldest value added if the length of list > 10
    viewHistory.add(productId.toString());
    viewHistory = [
      ...{...viewHistory}
    ];

    await prefs
        .setStringList('viewProductHistory', viewHistory)
        .then((bool success) {
      return success;
    }).onError((error, stackTrace) => throw error!);
    return false;
  }

  Future<bool> clearViewProductHistory() async {
    final prefs = await _prefs;
    return await prefs.remove("viewProductHistory");
  }

  Future<List<int>?> futureGetViewProductHistory() async {
    final prefs = await _prefs;
    List<String>? res = await prefs.getStringList("viewProductHistory");
    return res!.map((e) => int.parse(e)).toList();
  }
}
