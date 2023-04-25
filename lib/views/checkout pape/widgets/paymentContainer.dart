import 'package:flutter/material.dart';

import '../../../services/vnpay/vnpay.dart';

class paymentContainer extends StatelessWidget {
  final paymentsList = [
    {"name": "Thanh toán khi nhận", "function": () {}, "image": ""},
    {"name": "VNPay", "function": () => vnpay(), "image": "LogoVnpay.png"}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        children: [
          Container(
            child: Row(
              children: const [
                Icon(Icons.wallet),
                SizedBox(
                  width: 10,
                ),
                Text("Mã giảm giá")
              ],
            ),
          ),
          ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var i in paymentsList)
                InkWell(
                  onTap: () {
                    (i["function"] as Function)();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Text(i["name"].toString()),
                        Image.asset(i["image"].toString())
                      ],
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
