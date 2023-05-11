import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/order/order.dart';
import '../../../services/http/constant.dart';

Future<Order> futureGetOrderDetail(int orderId) async {
  http.Response response =
      await http.get(Uri.parse('$baseUrl/api/invoice/show/$orderId'));
  if (response.statusCode == 200) {
    print(json.decode(response.body));
    return Order.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load list of orders ');
  }
}
