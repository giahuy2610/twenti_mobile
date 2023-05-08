import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class OrderMenu extends StatelessWidget {
  const OrderMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15.0, top: 15, bottom: 5),
          child: Text(
            'Đơn hàng của tôi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        //Order status menu
        SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                },
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
                onTap: () {
                },
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
                onTap: () {
                },
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
                onTap: () {
                },
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
    );
  }
}
