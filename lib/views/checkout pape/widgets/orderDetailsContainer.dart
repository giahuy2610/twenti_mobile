import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';

class OrderDetailsContainer extends StatelessWidget {
  String total = "100";
  String coupon = "50";
  String couponValue = "50";
  String lastTotal = "50";

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
                    Image.asset("assets/icons/icons8_invoice.png"),
                    Text("Chi tiết thanh toán")
                  ],
                ),
                SizedBox(height: Theme.of(context).own().defaultMarginBetween),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Tổng cộng"), Text(total)],
                ),
                SizedBox(height: Theme.of(context).own().defaultMarginBetween),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Giảm giá"), Text(couponValue)],
                ),
                SizedBox(height: Theme.of(context).own().defaultMarginBetween),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Tổng thanh toán"), Text(lastTotal)],
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Tổng thanh toán"), Text(lastTotal)],
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
