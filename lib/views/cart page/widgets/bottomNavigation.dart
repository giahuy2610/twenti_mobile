import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:twenti_mobile/views/checkout%20pape/checkoutPage.dart';

import '../../../providers/cartProvider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: const BoxDecoration(color: Colors.pinkAccent),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: 'Tổng: ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: context.watch<CartProvider>().total.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeftPop,
                      child: const checkoutPage(),
                      childCurrent: widget)),
              child: Container(
                // height: double.infinity,
                width: MediaQuery.of(context).size.width * 0.4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: Colors.black),
                child: const Text(
                  "Thanh toán",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }
}
