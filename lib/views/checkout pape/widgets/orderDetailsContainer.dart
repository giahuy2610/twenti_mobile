import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:twenti_mobile/services/currency_format/currencyFormat.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/order_detail_page/orderDetailPage.dart';

import '../../../providers/cartProvider.dart';
import '../../order_detail_page/controllers/futureGetOrderDetail.dart';

class OrderDetailsContainer extends StatelessWidget {
  final total = 100;
  final coupon = 50;
  final couponValue = 50;
  final lastTotal = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).own().defaultContainerColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).own().defaultScaffoldColor,
                spreadRadius: 1)
          ]),
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
                  children: [
                    Text("Tổng cộng"),
                    Text(currencyFormat(context.watch<CartProvider>().total))
                  ],
                ),
                SizedBox(height: Theme.of(context).own().defaultMarginBetween),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Giảm giá"),
                    (context.watch<CartProvider>().selectedCoupon != null)
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                context
                                    .watch<CartProvider>()
                                    .selectedCoupon!
                                    .codeCoupon,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "-${currencyFormat(context.watch<CartProvider>().selectedCoupon!.valueDiscount)}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        : Text(currencyFormat(0)),
                  ],
                ),
                SizedBox(height: Theme.of(context).own().defaultMarginBetween),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tổng thanh toán"),
                    Text(currencyFormat(context.watch<CartProvider>().total -
                        (context.watch<CartProvider>().selectedCoupon == null
                            ? 0
                            : context
                                .watch<CartProvider>()
                                .selectedCoupon!
                                .valueDiscount)))
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).own().defaultContainerColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).own().defaultScaffoldColor,
                      spreadRadius: 1)
                ]),
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
                          Text(
                              currencyFormat(
                                  context.watch<CartProvider>().total -
                                      (context
                                                  .watch<CartProvider>()
                                                  .selectedCoupon ==
                                              null
                                          ? 0
                                          : context
                                              .watch<CartProvider>()
                                              .selectedCoupon!
                                              .valueDiscount)),
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
                      onTap: () {
                        context.read<CartProvider>().makeToOrder().then(
                            (value) async => Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    child: OrderDetailPage(
                                        await futureGetOrderDetail(value)),
                                    childCurrent: this)));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: double.infinity,
                          child: Text(
                            "Đặt hàng",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .own()
                                    .defaultContainerColor),
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
