import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:twenti_mobile/providers/cartProvider.dart';
import 'package:twenti_mobile/themes/theme.dart';

import '../../address_checkout_page/addressCheckoutPage.dart';

class AddressContainer extends StatelessWidget {
  String name = "jdj";
  String phone = "0";
  String address =
      "bdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibd";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: Theme.of(context).own().defaultProductCardMargin),
      child: Material(
        color: Theme.of(context).own().defaultContainerColor,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    child: AddressCheckoutPage(),
                    childCurrent: this));
          },
          child: Container(
            padding: EdgeInsets.all(
                Theme.of(context).own().defaultVerticalPaddingOfScreen),
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/icons8_marker.png",
                  width: 48,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Địa chỉ nhận hàng",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(context.watch<CartProvider>().nameCustomer +
                          '|' +
                          context.watch<CartProvider>().phoneCustomer),
                      Text(
                        '${context.watch<CartProvider>().addressDetail}, ${context.watch<CartProvider>().ward}, ${context.watch<CartProvider>().district}, ${context.watch<CartProvider>().city}',
                        maxLines: 3,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                Icon(Icons.chevron_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
