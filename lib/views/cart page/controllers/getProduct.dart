import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:twenti_mobile/services/http/constant.dart';

import '../../../models/product/product.dart';
import '../../../services/shared preferences/sharedPreferences.dart';

Future<Product>? getProduct(int productId) async {
  http.Response response = await http.post(
    Uri.parse('$baseUrl/cart/show'),
    body: {
      "IDCus": await SharedPreferencesObject().futureGetIdCus().toString()
    },
  );

  if (response.statusCode == 200) {
    var res = Product.fromJson(json.decode(response.body)[0]);
    return res;
  } else {
    throw Exception('Failed to load post');
  }
}
