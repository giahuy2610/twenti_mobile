import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:twenti_mobile/models/product.dart';

Future<List<Product>> fetchPost() async {
  final response = await http.get(
    Uri.parse("http://10.0.2.2:8000/api/product/index"),
  );

  if (response.statusCode == 200) {
    print(1);
    var list = json.decode(response.body);
    var a = await Product.fromJson(json.decode(response.body)[0]);
    print(11);
    return [a, a];
  } else {
    throw Exception('Failed to load post');
  }
}
