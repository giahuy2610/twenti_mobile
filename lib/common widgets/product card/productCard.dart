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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ProductPage()));
          },
          child: Column(
            children: [
              Image.network(product.images!.first.path!),
              Column(
                children: [Text("Brand"), Text("Product name"), Text("Price")],
              )
            ],
          ),
        ));
  }
}
