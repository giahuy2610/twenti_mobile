import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';

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
      padding: EdgeInsets.fromLTRB(
          Theme.of(context).own().defaultVerticalPaddingOfScreen,
          Theme.of(context).own().defaultVerticalPaddingOfScreen,
          0,
          Theme.of(context).own().defaultVerticalPaddingOfScreen),
      decoration:
          BoxDecoration(color: Theme.of(context).own().defaultContainerColor),
      height: 170,
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/icons8_payment.png",
                  width: 36,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("Phương pháp thanh toán",
                    style: TextStyle(fontWeight: FontWeight.bold))
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
                    child: Material(
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
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(i["name"].toString()),
                              SizedBox(
                                  height: Theme.of(context)
                                      .own()
                                      .defaultMarginBetween),
                              Image.asset(
                                i["image"].toString(),
                                fit: BoxFit.fitHeight,
                              )
                            ],
                          ),
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
