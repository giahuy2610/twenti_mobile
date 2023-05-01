import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';

import 'couponSelectOverlay.dart';

class CouponContainer extends StatelessWidget {
  const CouponContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).own().defaultContainerColor,
      child: InkWell(
        onTap: () {
          openCouponOverlay(context);
        },
        child: Container(
          padding: EdgeInsets.all(
              Theme.of(context).own().defaultVerticalPaddingOfScreen),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/icons/icons8_voucher.png",
                    width: 36,
                  ),
                  Text("Mã giảm giá"),
                ],
              ),
              Text("Chọn hoặc nhập mã   >")
            ],
          ),
        ),
      ),
    );
  }
}
