import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../../models/product/cartProduct.dart';
import '../../../services/http/constant.dart';

Future<List<CartProduct>> futureAddToCart(int idProduct, int isAdd) async {
  var body = new Map();
  body['IDCus'] = 2;
  body['IDProduct'] = idProduct;
  body['IsAdd'] = isAdd;

  http.Response response = await http.post(
    Uri.parse('$baseUrl/api/cart/update'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(body),
  );

  if (response.statusCode == 200) {
    var list = json.decode(response.body);
    var res = <CartProduct>[];
    for (var i in list) {
      res.add(CartProduct.fromJson(i));
    }
    Fluttertoast.showToast(
        msg: "Đã thêm vào giỏ ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    return res;
  } else {
    throw Exception('Failed to load post');
  }
}
