import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common widgets/cart_icon/cartIcon.dart';
import '../../common widgets/top navigation/topNavigation.dart';
import '../../models/product/review.dart';
import '../../services/deep linking/deepLink.dart';
import '../product page/widgets/reviewItem.dart';

class reviewPage extends StatelessWidget {
  final List<Review> reviewList;
  reviewPage(this.reviewList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TopNavigation(
            left: Material(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.keyboard_arrow_left)),
            ),
            stepRight: Material(
                child: IconButton(
                    onPressed: () => CreateSharingDynamicLink(1),
                    icon: SvgPicture.asset('assets/icons/Send.svg'))),
            right: cartIcon()),
        Expanded(
            child: ListView(
          children: [
            Column(children: [for (var i in reviewList) reviewItem(i)])
          ],
        )),
      ],
    )));
  }
}
