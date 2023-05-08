import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';

import '../../../models/product/cartProduct.dart';
import '../../cart page/controllers/getCart.dart';
import '../../cart page/widgets/productCartItem.dart';
import '../../cart page/widgets/productCartItemSkeleton.dart';

class ProductCheckoutListView extends StatelessWidget {
  const ProductCheckoutListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CartProduct>>(
        future: getCart(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.symmetric(
                  vertical: Theme.of(context).own().defaultProductCardMargin),
              decoration: BoxDecoration(
                  color: Theme.of(context).own().defaultContainerColor),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                for (var i in (snapshot.data!))
                  ProductCartItem(
                    image: i.product.images!.first.path,
                    name: i.product.nameProduct,
                    id: i.product.idProduct,
                    price: i.product.retailPrice,
                    quantity: i.quantity,
                    isUseInCart: false,
                  )
              ]),
            );
          }
          return Column(children: [
            for (var i = 0; i < 6; i++) productCartItemSkeleton()
          ]);
        });
  }
}
