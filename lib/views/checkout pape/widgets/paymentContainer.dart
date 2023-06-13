import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenti_mobile/providers/cartProvider.dart';
import 'package:twenti_mobile/themes/theme.dart';

import '../../../services/vnpay/vnpay.dart';

class PaymentContainer extends StatefulWidget {
  @override
  State<PaymentContainer> createState() => _PaymentContainerState();
}

class _PaymentContainerState extends State<PaymentContainer> {
  List<Map<String, String>> paymentsList = [
    {
      "id": "1",
      "name": "Thanh toán khi nhận hàng",
      "image": "assets/icons/icons8_cash.png"
    },
    {
      "id": "2",
      "name": "Thanh toán qua VNPay",
      "image": "assets/icons/LogoVnpay.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: Theme.of(context).own().defaultProductCardMargin),
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
                for (Map<String, String> i in paymentsList)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Material(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                context.read<CartProvider>().paymentMethod =
                                    i['id']!;
                              });
                              vnpay();
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
                      ),
                      if (i['id'] == context.read<CartProvider>().paymentMethod)
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset("assets/icons/icon_check.png"),
                        )
                    ],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
