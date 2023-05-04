import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/order/order.dart';
import '../../../services/http/constant.dart';

Future<List<Order>> futureGetOrderByStatus(int statusId) async {
  http.Response response =
      await http.get(Uri.parse('$baseUrl/api/invoice/customer/2'));
  if (response.statusCode == 200) {
    List<Order> res = <Order>[];
    for (var i in json.decode(response.body)) res.add(Order.fromJson(i));

    return res;
  } else {
    throw Exception('Failed to load list of orders ');
  }
}
