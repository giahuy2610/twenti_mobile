import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/my_orders_page/myOrdersPage.dart';

class OrderMenu extends StatelessWidget {
  const OrderMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                child: MyOrdersPage(),
                childCurrent: this));
      },
      child: Container(
        decoration:
            BoxDecoration(color: Theme.of(context).own().defaultContainerColor),
        padding: EdgeInsets.all(
            Theme.of(context).own().defaultVerticalPaddingOfScreen),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'myOrders'.tr(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Text("all".tr()), Icon(Icons.chevron_right)],
                ),
              ],
            ),
            //Order status menu
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //svg icon and text
                      children: [
                        const SizedBox(height: 10),
                        SvgPicture.asset(
                          'assets/icons/pending.svg',
                          semanticsLabel: 'pending order',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'pending'.tr(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //svg icon and text
                      children: [
                        const SizedBox(height: 10),
                        SvgPicture.asset(
                          'assets/icons/delivering.svg',
                          semanticsLabel: 'delivering order',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'toShip'.tr(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //svg icon and text
                      children: [
                        const SizedBox(height: 10),
                        SvgPicture.asset(
                          'assets/icons/delivered.svg',
                          semanticsLabel: 'delivered order',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'completed'.tr(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //svg icon and text
                      children: [
                        const SizedBox(height: 10),
                        SvgPicture.asset(
                          'assets/icons/cancel.svg',
                          semanticsLabel: 'cancelled order',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'canceled'.tr(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
