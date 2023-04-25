import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twenti_mobile/views/cart%20page/widgets/bottomNavigation.dart';
import 'package:twenti_mobile/views/cart%20page/widgets/productCartListView.dart';

import '../../common widgets/top navigation/topNavigation.dart';

class CartPage extends StatelessWidget {
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
          right: IconButton(
            onPressed: () {},
            icon: Icon(Icons.restore_from_trash),
          ),
        ),
        const Expanded(child: ProductCartListView()),
        const BottomNavigation()
      ],
    )));
  }
}
