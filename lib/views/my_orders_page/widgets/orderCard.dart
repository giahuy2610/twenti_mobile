import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/services/currency_format/currencyFormat.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/cart%20page/widgets/productCartItem.dart';
import 'package:twenti_mobile/views/order_detail_page/orderDetailPage.dart';

import '../../../models/order/order.dart';
import '../trackingStatusConstrain.dart';

class OrderCard extends StatelessWidget {
  late final Order orderData;
  OrderCard(this.orderData);

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
                  child: OrderDetailPage(orderData),
                  childCurrent: this)),
          child: Container(
            padding: EdgeInsets.all(
                Theme.of(context).own().defaultVerticalPaddingOfScreen),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Đơn hàng #${orderData.iDInvoice}"),
                    Text(
                      statusList[orderData.iDTracking],
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
                              "17/04-Kiện hàng của bạn đã được giao thành công",
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
                    for (var i in orderData.products)
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
                      Text("Tổng cộng(${1} sản phẩm):"),
                      SizedBox(
                          width: Theme.of(context).own().defaultMarginBetween),
                      Text(
                        currencyFormat(orderData.totalValue),
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
                      child: Text(
                        "Mua lại",
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        side: BorderSide(
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: Theme.of(context).own().defaultMarginBetween),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "Đánh giá",
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        side: BorderSide(
                          color: Colors.redAccent,
                        ),
                      ),
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
