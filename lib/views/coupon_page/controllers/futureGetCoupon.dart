import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/coupon/Coupon.dart';
import '../../../services/http/constant.dart';

Future<List<CouponModel>> futureGetCoupon() async {
  http.Response response =
      await http.get(Uri.parse('$baseUrl/api/coupon/available'));
  if (response.statusCode == 200) {
    var list = json.decode(response.body);
    var res = <CouponModel>[];
    for (var i in list) {
      res.add(CouponModel.fromJson(i));
    }
    return res;
  } else {
    throw Exception('Failed to load coupon');
  }
}
