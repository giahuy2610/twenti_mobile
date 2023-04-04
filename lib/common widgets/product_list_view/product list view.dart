import 'package:flutter/material.dart';
import 'package:twenti_mobile/common%20widgets/product%20card/productCard.dart';

import '../../models/product/product.dart';

class productListView extends StatefulWidget {
  late List<Product> productList;
  productListView(this.productList);

  @override
  State<productListView> createState() => _productListViewState(productList);
}

class _productListViewState extends State<productListView> {
  late List<Product> productList;

  _productListViewState(this.productList);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                for (var i = 0; i < productList.length; i += 2)
                  productCard(productList[i])
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                for (var i = 1; i < productList.length; i += 2)
                  productCard(productList[i])
              ],
            ),
          )
        ],
      ),
    );
  }
}
