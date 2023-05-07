import 'package:flutter/material.dart';

import '../models/product/product.dart';

class CollectionPageProvider with ChangeNotifier {
  List<Product> _listOfProducts = <Product>[];
  List<Product> get listOfProducts => _listOfProducts;
  set setListOfProducts(newList) => this._listOfProducts = newList;

  void saveListOfProducts(List<Product> newList) {
    _listOfProducts = newList;
    notifyListeners();
  }

  void removeListOfProducts() {
    _listOfProducts = [];
    print("removed");
  }
}
