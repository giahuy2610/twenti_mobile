import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twenti_mobile/common%20widgets/product%20card/productCardSkeleton.dart';

import '../../models/product/product.dart';
import '../product card/productCard.dart';
import '../product card/productCartHorizontal.dart';

class productListView extends StatefulWidget {
  late List<Product> productList;
  final isGridView;
  productListView(this.productList, this.isGridView);

  @override
  State<productListView> createState() => _productListViewState(productList);
}

class _productListViewState extends State<productListView> {
  late List<Product> productList;

  _productListViewState(this.productList);

  Widget skeleton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [for (var i = 0; i < 3; i++) productCardSkeleton()],
          ),
        ),
        Expanded(
          child: Column(
            children: [for (var i = 0; i < 3; i++) productCardSkeleton()],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7),
        width: double.infinity,
        child: productList.length == 0
            ? Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3),
                child: SvgPicture.asset(
                  'assets/icons/Box_open.svg',
                  width: 100,
                ))
            : (widget.isGridView == true
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            for (var i = 0; i < productList.length; i += 2)
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: productCard(productList[i]),
                              )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            for (var i = 1; i < productList.length; i += 2)
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: productCard(productList[i]),
                              )
                          ],
                        ),
                      )
                    ],
                  )
                : Column(
                    children: [
                      for (var i = 1; i < productList.length; i += 1)
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: productCardHorizontal(productList[i]),
                        )
                    ],
                  )));
  }
}
