import '../../../models/coupon/Coupon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../services/http/constant.dart';
Future<List<CouponModel>> futureGetCoupon() async {
  http.Response response =
      await http.get(Uri.parse('$baseUrl/api/coupon/index'));
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