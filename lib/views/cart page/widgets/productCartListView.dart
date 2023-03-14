import 'package:flutter/cupertino.dart';
import 'package:twenti_mobile/views/cart%20page/widgets/productCartItem.dart';

import '../../../models/product.dart';
import '../controller/getCart.dart';

class ProductCartListView extends StatelessWidget {
  const ProductCartListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
        future: fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  for (var i in (snapshot.data!))
                    ProductCartItem(
                      image: i.Images[0],
                      name: i.NameProduct,
                      id: i.IDProduct,
                      price: i.RetailPrice,
                    )
                ]);
          }
          return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [Text("data")]);
        });
  }
}
