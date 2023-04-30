import 'package:flutter/material.dart';

import 'couponSelectOverlay.dart';

class CouponContainer extends StatelessWidget {
  const CouponContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openCouponOverlay(context);
      },
      child: Container(
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
    );
  }
}
