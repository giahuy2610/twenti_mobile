import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:twenti_mobile/models/product/cartProduct.dart';
import 'package:twenti_mobile/views/address_checkout_page/controllers/futureGetProvince.dart';
import 'package:twenti_mobile/views/cart%20page/controllers/futureAddToCart.dart';

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
  late String deviceTokenFCM;

  late String paymentMethod =
      "1"; //1 is cash on delivery, 2 is pay on vnpay gateway

  late Set<int> selectedProductInCart = {};

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
    // list.forEach((element) {
    //   selectedProductInCart.add(element.product.idProduct);
    // });
    calcTotalPrice();
    notifyListeners();
  }

  Future<Map<String, dynamic>> makeToOrder() async {
    var invDetail = [];
    getCheckoutProduct().forEach((e) {
      invDetail.add({
        "IDProduct": e.product.idProduct.toString(),
        "Quantity": e.quantity.toString(),
      });
    });
    late final body;
    await SharedPreferencesObject()
        .futureGetAccountLocal()
        .then((value) => body = jsonEncode({
              "IDCus": value.idcus,
              "MethodPay": paymentMethod,
              "CodeCoupon":
                  selectedCoupon == null ? null : selectedCoupon!.codeCoupon,
              "InvoiceDetail": invDetail,
              "City": city,
              "District": district,
              "Ward": ward,
              "AddressDetail": addressDetail,
              "Email": value.email,
              "Phone": phoneCustomer,
              "FirstName": nameCustomer,
              "LastName": ".",
              "DeviceTokenFCM": deviceTokenFCM
            }));

    http.Response response = await http.post(
      headers: {"Content-type": "application/json"},
      Uri.parse('$baseUrl/api/invoice/create'),
      body: body,
    );
    return {
      'IDInvoice': jsonDecode(response.body)['IDInvoice'],
      "MethodPay": jsonDecode(response.body)['MethodPay'],
      "TotalValue": jsonDecode(response.body)['TotalValue']
    };
  }

  void calcTotalPrice() {
    //update total of price
    _total = 0;
    _cartProducts.forEach((i) {
      if (selectedProductInCart.contains(i.product.idProduct)) {
        _total += i.quantity * i.product.retailPrice;
      }
    });
  }

  Set<int> addToSelectedProductInCart(int id, bool isAdd) {
    isAdd == true
        ? selectedProductInCart.add(id)
        : selectedProductInCart.remove(id);
    calcTotalPrice();
    notifyListeners();
    return selectedProductInCart;
  }

  List<CartProduct> getCheckoutProduct() {
    List<CartProduct> res = [];
    print("selected product in cart");
    print(selectedProductInCart);
    _cartProducts.forEach((e) {
      if (selectedProductInCart.contains(e.product.idProduct)) res.add(e);
    });
    print(res);
    return res;
  }

  void getBuyNow(id) {
    selectedProductInCart = {id};
    calcTotalPrice();
    notifyListeners();
  }

  Future getBuyAgain(List<CartProduct> listId, context) async {
    selectedProductInCart = {};
    //add the number of product
    for (var e in listId) {
      for (var i = 0; i < e.quantity; i++)
        await futureAddToCart(context, e.product.idProduct, 1);
      selectedProductInCart.add(e.product.idProduct);
    }
    calcTotalPrice();
    notifyListeners();
  }
}
