import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:twenti_mobile/services/http/constant.dart';

import '../../../models/product/cartProduct.dart';

Future<List<CartProduct>>? getCart() async {
  http.Response response = await http.post(
    Uri.parse('$baseUrl/api/cart/show'),
    body: {"IDCus": "2"},
  );

  if (response.statusCode == 200) {
    var list = json.decode(response.body);
    var res = <CartProduct>[];
    for (var i in list) {
      res.add(CartProduct.fromJson(i));
    }
    return res;
  } else {
    throw Exception('Failed to load post');
  }
}
