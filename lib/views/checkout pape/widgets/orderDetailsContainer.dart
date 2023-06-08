import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:twenti_mobile/services/currency_format/currencyFormat.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/order_detail_page/orderDetailPage.dart';
import 'package:twenti_mobile/views/vnpay/vnpay.dart';

import '../../../providers/cartProvider.dart';
import '../../cart page/controllers/getCart.dart';
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
            padding: EdgeInsets.symmetric(
              horizontal:
                  Theme.of(context).own().defaultVerticalPaddingOfScreen,
              vertical: 4,
            ),
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
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Theme.of(context)
                                      .own()
                                      .defaultScaffoldColor))),
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.only(right: 10),
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
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Color.fromRGBO(215, 129, 121, 1)))
                        ],
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: Material(
                    color: const Color.fromRGBO(215, 129, 121, 1),
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () {
                        context
                            .read<CartProvider>()
                            .makeToOrder()
                            .then((value) async {
                          //route to vnpay gate way if paymethod == 2
                          getCart(context);
                          if (value['MethodPay'] == '2') {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: Vnpay(value['IDInvoice']),
                                    childCurrent: this));
                          }

                          //else => complete shopping processing
                          else {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    child: OrderDetailPage(
                                        await futureGetOrderDetail(
                                            value['IDInvoice'])),
                                    childCurrent: this));
                          }
                        });
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: double.infinity,
                          decoration: BoxDecoration(),
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
