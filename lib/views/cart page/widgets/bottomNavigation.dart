import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenti_mobile/providers/cartProvider.dart';

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
        decoration: BoxDecoration(color: Colors.pinkAccent),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: 'Total ',
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                      text: '200.000d',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                ],
              ),
            ),
            InkWell(
              onTap: () => context.read<CartProvider>().increment(),
              child: Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width * 0.4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: Colors.black),
                child: const Text(
                  "PAY",
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
