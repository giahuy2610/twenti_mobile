import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:twenti_mobile/models/product/cartProduct.dart';
import 'package:twenti_mobile/views/address_checkout_page/controllers/futureGetProvince.dart';

import '../../../services/http/constant.dart';
import '../models/coupon/Coupon.dart';
import '../services/shared preferences/sharedPreferences.dart';
import '../views/address_checkout_page/controllers/futureGetDistrict.dart';
import '../views/address_checkout_page/controllers/futureGetWard.dart';

class CartProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  int _total = 0;
  int get total => _total;

  int _numOfProducts = 0;
  int get numOfProducts => _numOfProducts;

  late List<CartProduct> _cartProducts;
  List<CartProduct> get cartProducts => _cartProducts;

  CouponModel? _selectedCoupon;
  CouponModel? get selectedCoupon => _selectedCoupon;

  late String nameCustomer = 'name';
  late String phoneCustomer = 'phone';
  late String addressDetail = 'address';
  late String city = 'province';
  late String district = 'district';
  late String ward = 'ward';

  late String paymentMethod =
      "1"; //1 is cash on delivery, 2 is pay on vnpay gateway

  Future<void> saveCustomerAddressContact(
      String a, String b, String c, String d, String e, String f) async {
    this.nameCustomer = a;
    this.phoneCustomer = b;

    //get city name by code
    await futureGetProvince().then((value) =>
        this.city = value[value.indexWhere((f) => f['id'] == c)]['name']!);

    //get district name by code
    await futureGetDistrict(c).then((value) =>
        this.district = value[value.indexWhere((f) => f['id'] == d)]['name']!);

    //get ward name by code
    await futureGetWard(d).then((value) =>
        this.ward = value[value.indexWhere((f) => f['id'] == e)]['name']!);

    this.addressDetail = f;
    notifyListeners();
  }

  void setCoupon(CouponModel coupon) {
    _selectedCoupon = coupon;
    notifyListeners();
  }

  void saveCartProducts(List<CartProduct> list) {
    print('saving cart');
    _cartProducts = list;
    //update total number of products in cart
    _numOfProducts = list.length;
    //update total of price
    _total = 0;
    for (var i in list) {
      _total += i.quantity * i.product.retailPrice;
    }
    notifyListeners();
  }

  Future<Map<String, dynamic>> makeToOrder() async {
    var invDetail = [];
    this.cartProducts.forEach((e) {
      invDetail.add({
        "IDProduct": e.product.idProduct.toString(),
        "Quantity": e.quantity.toString(),
      });
    });
    late final body;
    await SharedPreferencesObject()
        .futureGetIdCus()
        .then((value) => body = jsonEncode({
              "IDCus": value.toString(),
              "MethodPay": this.paymentMethod,
              "CodeCoupon": this.selectedCoupon == null
                  ? null
                  : this.selectedCoupon!.codeCoupon,
              "InvoiceDetail": invDetail,
              "City": this.city,
              "District": this.district,
              "Ward": this.ward,
              "AddressDetail": this.addressDetail,
              "Email": "giahuytrinh.26102002@gmail.com",
              "Phone": this.phoneCustomer,
              "FirstName": this.nameCustomer,
              "LastName": "."
            }));

    http.Response response = await http.post(
      headers: {"Content-type": "application/json"},
      Uri.parse('$baseUrl/api/invoice/create'),
      body: body,
    );
    return {
      'IDInvoice': jsonDecode(response.body)['IDInvoice'],
      "MethodPay": jsonDecode(response.body)['MethodPay']
    };
  }
}
