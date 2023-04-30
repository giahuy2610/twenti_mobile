import 'package:flutter/material.dart';

class OrderDetailsContainer extends StatelessWidget {
  String total = "100";
  String coupon = "50";
  String couponValue = "50";
  String lastTotal = "50";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Image.asset("assets/icons/icons8_invoice.png"),
              Text("Chi tiết thanh toán")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Tổng cộng"), Text(total)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Giảm giá"), Text(couponValue)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Tổng thanh toán"), Text(lastTotal)],
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
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        color: Colors.red,
                        child: Text(
                          "Đặt hàng",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
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
