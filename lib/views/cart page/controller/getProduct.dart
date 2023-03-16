import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/product/product.dart';

Future<Product>? getProduct(int productId) async {
  http.Response response = await http.post(
    Uri.parse('http://192.168.1.4:8000/api/cart/show'),
    body: {"IDCus": "2"},
  );

  if (response.statusCode == 200) {
    var res = Product.fromJson(json.decode(response.body)[0]);
    return res;
  } else {
    throw Exception('Failed to load post');
  }
}
