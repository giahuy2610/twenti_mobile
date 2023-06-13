import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/coupon_page/couponPage.dart';

class CouponContainer extends StatelessWidget {
  const CouponContainer({Key? key}) : super(key: key);

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
                    child: CouponPage(),
                    childCurrent: this));
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
                    SizedBox(
                        width: Theme.of(context).own().defaultMarginBetween),
                    Text("Mã giảm giá",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  children: [
                    Text("Chọn hoặc nhập mã"),
                    Icon(Icons.chevron_right)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
