import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../models/product/cartProduct.dart';
import '../../../providers/cartProvider.dart';
import '../../../services/http/constant.dart';
import '../../../services/shared preferences/sharedPreferences.dart';

Future<bool> futureAddToCart(
    BuildContext context, int idProduct, int isAdd) async {
  var body = {};
  await SharedPreferencesObject()
      .futureGetIdCus()
      .then((value) => body['IDCus'] = value.toString());
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
    if (isAdd == 1) {
      Fluttertoast.showToast(
          msg: "Đã thêm vào giỏ ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Đã xóa sản phẩm ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    context.read<CartProvider>().saveCartProducts(res);
    return true;
  } else {
    //throw Exception('Failed to load post');
    return false;
  }
}
