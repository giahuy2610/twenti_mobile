import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:twenti_mobile/views/cart%20page/widgets/productCartItem.dart';

import '../../../models/product/cartProduct.dart';
import '../../../providers/cartProvider.dart';
import '../controllers/getCart.dart';

class ProductCartListView extends StatelessWidget {
  const ProductCartListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CartProduct>>(
        future: getCart(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            context.read<CartProvider>().saveCartProducts(snapshot.data!);
            return ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [Text("loading")]);
        });
  }
}
