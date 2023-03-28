import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/product/collection.dart';
import '../../../services/http/constant.dart';

Future<Collection> futureGetCollection(int id) async {
  http.Response response =
      await http.get(Uri.parse('$baseUrl/api/collection/show/$id'));
  if (response.statusCode == 200) {
    var res = Collection.fromJson(json.decode(response.body));
    print(res);
    return res;
  } else {
    throw Exception('Failed to load');
  }
}
