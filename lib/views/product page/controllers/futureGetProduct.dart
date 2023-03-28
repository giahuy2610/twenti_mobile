import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/product/product.dart';
import '../../../services/http/constant.dart';

Future<Product> futureGetProduct(int id) async {
  http.Response response =
      await http.get(Uri.parse('$baseUrl/api/product/show/$id'));
  if (response.statusCode == 200) {
    var res = Product.fromJson(json.decode(response.body));
    print(res);
    return res;
  } else {
    throw Exception('Failed to load');
  }
}
