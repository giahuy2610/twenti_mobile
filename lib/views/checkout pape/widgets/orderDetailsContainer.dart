import 'package:flutter/material.dart';
import 'package:twenti_mobile/services/currency_format/currencyFormat.dart';
import 'package:twenti_mobile/themes/theme.dart';

class OrderDetailsContainer extends StatelessWidget {
  final total = 100;
  final coupon = 50;
  final couponValue = 50;
  final lastTotal = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Theme.of(context).own().defaultContainerColor),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(
                Theme.of(context).own().defaultVerticalPaddingOfScreen),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/icons8_invoice.png",
                      width: 36,
                    ),
                    Text("Chi tiết thanh toán",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(height: Theme.of(context).own().defaultMarginBetween),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Tổng cộng"), Text(currencyFormat(total))],
                ),
                SizedBox(height: Theme.of(context).own().defaultMarginBetween),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Giảm giá"),
                    Text(currencyFormat(couponValue))
                  ],
                ),
                SizedBox(height: Theme.of(context).own().defaultMarginBetween),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tổng thanh toán"),
                    Text(currencyFormat(lastTotal))
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Tổng thanh toán"),
                          Text(currencyFormat(lastTotal),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24))
                        ],
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: Material(
                    color: Colors.red,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          alignment: Alignment.center,
                          height: double.infinity,
                          child: Text(
                            "Đặt hàng",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
