import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/services/currency_format/currencyFormat.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/cart%20page/widgets/productCartItem.dart';
import 'package:twenti_mobile/views/make_review_page/makeReviewPage.dart';
import 'package:twenti_mobile/views/order_detail_page/orderDetailPage.dart';

import '../../../models/order/order.dart';
import '../controllers/futureCancelOrder.dart';
import '../trackingStatusConstrain.dart';

class OrderCard extends StatefulWidget {
  late final Order orderData;
  OrderCard(this.orderData);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Theme.of(context).own().defaultProductCardMargin),
      child: Material(
        color: Theme.of(context).own().defaultContainerColor,
        child: InkWell(
          onTap: () => Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  child: OrderDetailPage(widget.orderData),
                  childCurrent: widget)),
          child: Container(
            padding: EdgeInsets.all(
                Theme.of(context).own().defaultVerticalPaddingOfScreen),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Đơn hàng #${widget.orderData.iDInvoice}"),
                    Text(
                      statusList[widget.orderData.iDTracking],
                      style: TextStyle(color: Colors.blueAccent),
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.symmetric(
                        vertical: Theme.of(context).own().defaultMarginBetween),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blueAccent.shade700)),
                    padding: EdgeInsets.all(
                        Theme.of(context).own().defaultVerticalPaddingOfScreen),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.delivery_dining),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Theme.of(context)
                                    .own()
                                    .defaultMarginBetween),
                            child: Text(
                              "${statusDescriptionList[widget.orderData.iDTracking]}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Icon(Icons.chevron_right)
                      ],
                    )),
                Column(
                  children: [
                    for (var i in widget.orderData.products)
                      ProductCartItem(
                        name: i.product.nameProduct,
                        id: i.product.idProduct,
                        price: i.product.retailPrice,
                        quantity: i.quantity,
                        image: i.product.images!.first.path,
                        isUseInCart: false,
                      )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Theme.of(context).own().defaultMarginBetween),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          "Tổng cộng(${widget.orderData.products.length} sản phẩm):"),
                      SizedBox(
                          width: Theme.of(context).own().defaultMarginBetween),
                      Text(
                        currencyFormat(widget.orderData.totalValue),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Mua lại",
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        side: const BorderSide(
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    if (widget.orderData.iDTracking == 4)
                      Row(
                        children: [
                          SizedBox(
                              width:
                                  Theme.of(context).own().defaultMarginBetween),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: MakeReviewPage(
                                          widget.orderData.products),
                                      childCurrent: widget));
                            },
                            child: const Text(
                              "Đánh giá",
                              style: TextStyle(
                                color: Colors.redAccent,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              side: const BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (widget.orderData.iDTracking == 1 ||
                        widget.orderData.iDTracking == 2)
                      Row(
                        children: [
                          SizedBox(
                              width:
                                  Theme.of(context).own().defaultMarginBetween),
                          OutlinedButton(
                            onPressed: () {
                              futureCancelOrder(widget.orderData.iDInvoice)
                                  .then((value) {
                                setState(() {
                                  widget.orderData.iDTracking = 6;
                                });
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              side: const BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                            child: const Text(
                              "Hủy đơn",
                              style: TextStyle(
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
