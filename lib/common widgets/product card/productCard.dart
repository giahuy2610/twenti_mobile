import 'package:flutter/material.dart';
import 'package:twenti_mobile/views/product%20page/productPage.dart';

import '../../models/product/product.dart';

class productCard extends StatelessWidget {
  late Product product;

  productCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black45.withOpacity(0.1),
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          elevation: 5,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProductPage()));
            },
            child: Column(
              children: [
                Image.network(product.images!.first.path!),
                Column(
                  children: [
                    Text("Brand"),
                    Text("Product name"),
                    Text("Price")
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
