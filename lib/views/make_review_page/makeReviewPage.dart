import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/make_review_page/widgets/aboutProductContainer.dart';
import 'package:twenti_mobile/views/make_review_page/widgets/reviewFieldsContainer.dart';

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
            child: Column(
          children: [
            AboutProductContainer(),
            ReviewFieldsContainer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Theme.of(context).own().defaultVerticalPaddingOfScreen),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const SizedBox(
                      width: double.infinity, child: Center(child: Text("Gửi")))),
            )
          ],
        )),
      ],
    )));
  }
}
