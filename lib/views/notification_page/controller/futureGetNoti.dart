import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/notification/notification.dart';
import '../../../services/http/constant.dart';
import '../../../services/shared preferences/sharedPreferences.dart';

Future<List<NotificationModel>> futureGetNotification() async {
  print("hello world");
  var temp;
  await SharedPreferencesObject().futureGetIdCus().then((value) async {
    print("dbidbiudb");
    temp = value;
  });
  http.Response response = await http.post(Uri.parse('$baseUrl/api/get-noti'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'IDCus': 1}));
  if (response.statusCode == 200) {
    var list = json.decode(response.body);
    var res = <NotificationModel>[];
    for (var i in list) {
      res.add(NotificationModel.fromJson(i));
    }
    return res;
  } else {
    throw Exception('Failed to load Notification');
  }
}
