import 'package:shared_preferences/shared_preferences.dart';

import '../../models/account/account.dart';

class SharedPreferencesObject {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  /*Local cache structure
  {
    'searchingHistory' : List<String>['kem duong','mat na'],
    'loginState': bool true
  }
   */

  Future<bool> saveCoachGuideState(bool newState) async {
    final prefs = await _prefs;
    await prefs.setBool('coachState', newState).then((bool success) {});
    return true;
  }

  Future<bool> getCoachGuideState() async {
    final prefs = await _prefs;
    bool? res = await prefs.getBool('coachState');
    return res ?? false;
  }

  Future<bool> saveLoginState(Account account) async {
    final prefs = await _prefs;
    await prefs.setString('idcus', account.idcus).then((bool success) {});
    await prefs.setString('namecus', account.name).then((bool success) {});
    await prefs.setString('emailcus', account.email).then((bool success) {});
    await prefs.setString('phonecus', account.phone!).then((bool success) {});
    return true;
  }

  //Search history
  Future<bool> saveSearchingHistory(String value) async {
    final prefs = await _prefs;
    //get current list
    List<String> searchingHistory = <String>[];
    List<String>? currList = prefs.getStringList("searchingHistory");
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
    return prefs.getStringList("searchingHistory");
  }

  Future<bool> saveViewProductHistory(int productId) async {
    final prefs = await _prefs;
    //get current list
    List<String> viewHistory = <String>[];
    List<String>? currList = prefs.getStringList("viewProductHistory");
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
    List<String>? res = prefs.getStringList("viewProductHistory");
    return res!.reversed.map((e) => int.parse(e)).toList();
  }

  Future<Account> futureGetAccountLocal() async {
    final prefs = await _prefs;
    final Account acc = Account(
        prefs.getString('idcus')!,
        prefs.getString('emailcus')!,
        prefs.getString('namecus')!,
        prefs.getString('phonecus')!);
    return acc;
  }

  Future<int> futureGetIdCus() async {
    final prefs = await _prefs;
    final id = prefs.getString('idcus');
    if (id != null)
      return int.parse(id);
    else
      return 0;
  }
}
