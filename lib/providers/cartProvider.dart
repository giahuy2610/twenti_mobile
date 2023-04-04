import 'package:flutter/cupertino.dart';
import 'package:twenti_mobile/models/product/cartProduct.dart';

class CartProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  int _total = 0;
  int get total => _total;

  int _numOfProducts = 0;
  int get numOfProducts => _numOfProducts;

  late List<CartProduct> _cartProducts;
  List<CartProduct> get cartProducts => _cartProducts;

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
}
