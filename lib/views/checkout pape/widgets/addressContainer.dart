import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/themes/theme.dart';

import '../../address_checkout_page/addressCheckoutPage.dart';

class AddressContainer extends StatelessWidget {
  String name = "jdj";
  String phone = "0";
  String address =
      "bdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibdbdiudbibdibduidbdbdibdibd";

  @override
  Widget build(BuildContext context) {
    return Material(
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
                    Text("Địa chỉ nhận hàng"),
                    Text(name + '|' + phone),
                    Text(
                      address,
                      maxLines: 3,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
