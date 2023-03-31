import 'package:flutter/material.dart';
import 'package:twenti_mobile/common%20widgets/sale_percent_badge/salePercentBadge.dart';
import 'package:twenti_mobile/views/product%20page/productPage.dart';

import '../../models/product/product.dart';

class productCard extends StatelessWidget {
  late Product product;

  productCard(this.product);

  @override
  Widget build(BuildContext context) {
    var salePercent =
        (100 - product.retailPrice / product.listPrice * 100).toInt();
    return Container(
        margin: const EdgeInsets.all(5),
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
                  context,
                  MaterialPageRoute(
                      builder: (_) => ProductPage(product.idProduct)));
            },
            child: Column(
              children: [
                Image.network(product.images!.first.path!),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text(product.brand!.nameBrand),
                      Text(product.nameProduct),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(product.retailPrice.toString()),
                          salePercent != 0
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: salePercentBadge(salePercent),
                                )
                              : Text(""),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
