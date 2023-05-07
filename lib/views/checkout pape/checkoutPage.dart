import 'package:flutter/material.dart';
import 'package:twenti_mobile/views/checkout%20pape/widgets/addressContainer.dart';
import 'package:twenti_mobile/views/checkout%20pape/widgets/couponContainer.dart';
import 'package:twenti_mobile/views/checkout%20pape/widgets/orderDetailsContainer.dart';
import 'package:twenti_mobile/views/checkout%20pape/widgets/paymentContainer.dart';
import 'package:twenti_mobile/views/checkout%20pape/widgets/productCheckoutListView.dart';

import '../../common widgets/top navigation/topNavigation.dart';

class checkoutPage extends StatefulWidget {
  const checkoutPage({Key? key}) : super(key: key);

  @override
  State<checkoutPage> createState() => _checkoutPageState();
}

class _checkoutPageState extends State<checkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  "Thanh toán",
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            isSearcher: false),
        Expanded(
            child: ListView(
          children: [
            AddressContainer(),
            ProductCheckoutListView(),
            CouponContainer(),
            PaymentContainer(),
          ],
        )),
        OrderDetailsContainer()
      ],
    )));
  }
}
