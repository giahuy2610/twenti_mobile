import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenti_mobile/themes/theme.dart';

import '../../../providers/cartProvider.dart';
import '../../cart page/widgets/productCartItem.dart';

class ProductCheckoutListView extends StatelessWidget {
  late final isBuyNow;
  ProductCheckoutListView(this.isBuyNow);
  late final listProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: Theme.of(context).own().defaultProductCardMargin),
      decoration:
          BoxDecoration(color: Theme.of(context).own().defaultContainerColor),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        for (var i in (context.read<CartProvider>().getCheckoutProduct()))
          ProductCartItem(
            image: i.product.images!.first.path,
            name: i.product.nameProduct,
            id: i.product.idProduct,
            price: i.product.retailPrice,
            quantity: i.quantity,
            isUseInCart: isBuyNow,
          )
      ]),
    );
  }
}
