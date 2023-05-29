import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:twenti_mobile/services/currency_format/currencyFormat.dart';
import 'package:twenti_mobile/themes/theme.dart';
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
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: Theme.of(context).own().defaultContainerColor,
            border: Border(
                top: BorderSide(
                    width: 1,
                    color: Theme.of(context).own().defaultScaffoldColor))),
        padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: Theme.of(context).own().defaultVerticalPaddingOfScreen),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: 'Tổng: ',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            currencyFormat(context.watch<CartProvider>().total),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28)),
                  ],
                ),
              ),
            ),
            Material(
              child: InkWell(
                onTap: () => context.watch<CartProvider>().total > 0
                    ? Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const checkoutPage(),
                            childCurrent: widget))
                    : null,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      color: context.watch<CartProvider>().total > 0
                          ? Colors.black
                          : Colors.grey),
                  child: const Text(
                    "Thanh toán",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
