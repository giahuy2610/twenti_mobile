import 'package:flutter/material.dart';

import '../../common widgets/top navigation/topNavigation.dart';
import '../../models/product/cartProduct.dart';

class MakeReviewPage extends StatefulWidget {
  final List<CartProduct> listProduct;
  MakeReviewPage(this.listProduct);

  @override
  State<MakeReviewPage> createState() => _MakeReviewPageState();
}

class _MakeReviewPageState extends State<MakeReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TopNavigation(
          left: Row(
            children: [
              Material(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.keyboard_arrow_left)),
              ),
              Text(
                "Đánh giá",
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
          isSearcher: false,
        ),
        Expanded(
            child: ListView(
          padding: EdgeInsets.all(10),
          children: [],
        )),
      ],
    )));
  }
}
