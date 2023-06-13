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
                  'Đơn hàng của tôi',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Text("Xem tất cả"), Icon(Icons.chevron_right)],
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
                        const Text(
                          'Chờ xác nhận',
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
                        const Text(
                          'Đang giao',
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
                        const Text(
                          'Đã giao',
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
                        const Text(
                          'Đã hủy',
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
