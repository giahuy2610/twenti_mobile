import 'package:flutter/cupertino.dart';

import 'futureAddToCart.dart';

Future<void> futureRemoveToCart(
    BuildContext context, int idProduct, int quantity) async {
  for (var i = 0; i < quantity; i++) futureAddToCart(context, idProduct, 0);
}
