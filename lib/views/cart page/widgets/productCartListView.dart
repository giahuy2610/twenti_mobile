import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/cart%20page/widgets/productCartItem.dart';
import 'package:twenti_mobile/views/cart%20page/widgets/productCartItemSkeleton.dart';

import '../../../models/product/cartProduct.dart';
import '../controllers/getCart.dart';

class ProductCartListView extends StatelessWidget {
  const ProductCartListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CartProduct>>(
        future: getCart(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
                padding: EdgeInsets.symmetric(
                    vertical:
                        Theme.of(context).own().defaultVerticalPaddingOfScreen),
                children: [
                  for (var i in (snapshot.data!))
                    ProductCartItem(
                      image: i.product.images!.first.path,
                      name: i.product.nameProduct,
                      id: i.product.idProduct,
                      price: i.product.retailPrice,
                      quantity: i.quantity,
                    )
                ]);
          }
          return ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical:
                      Theme.of(context).own().defaultVerticalPaddingOfScreen),
              children: [
                for (var i = 0; i < 6; i++) productCartItemSkeleton()
              ]);
        });
  }
}
