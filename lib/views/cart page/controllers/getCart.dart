import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:twenti_mobile/services/http/constant.dart';

import '../../../models/product/cartProduct.dart';
import '../../../providers/cartProvider.dart';

Future<List<CartProduct>>? getCart(BuildContext context) async {
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
    context.read<CartProvider>().saveCartProducts(res);
    return res;
  } else {
    throw Exception('Failed to load post');
  }
}
