import 'package:twenti_mobile/models/product.dart';

class Cart {
  late final List<Product> list;

  Cart.fromJson(dynamic json) : list = json;
}
