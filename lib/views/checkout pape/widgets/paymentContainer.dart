import 'package:flutter/material.dart';

import '../../../services/vnpay/vnpay.dart';

class PaymentContainer extends StatelessWidget {
  final paymentsList = [
    {
      "name": "Thanh toán khi nhận hàng",
      "function": () {},
      "image": "assets/icons/icons8_cash.png"
    },
    {
      "name": "Thanh toán qua VNPay",
      "function": () => vnpay(),
      "image": "assets/icons/LogoVnpay.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/icons8_payment.png",
                  width: 48,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("Phương pháp thanh toán")
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var i in paymentsList)
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        (i["function"] as Function)();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black45.withOpacity(0.3),
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                            color: Colors.white),
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(i["name"].toString()),
                            const SizedBox(
                              height: 5,
                            ),
                            Image.asset(
                              i["image"].toString(),
                              fit: BoxFit.fitHeight,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
