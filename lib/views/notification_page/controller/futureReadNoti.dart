import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../services/http/constant.dart';

Future<bool> futureReadNotification(IdNoti) async {
  http.Response response = await http.post(Uri.parse('$baseUrl/api/read-noti'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'IDNoti': IdNoti.toString()}));
  if (response.statusCode == 200) {
    return true;
  } else {
    throw Exception('Failed to load Notification');
  }
}
