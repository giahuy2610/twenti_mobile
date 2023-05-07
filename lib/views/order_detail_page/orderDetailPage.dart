import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';

import '../../common widgets/top navigation/topNavigation.dart';
import '../../models/order/order.dart';
import '../../services/currency_format/currencyFormat.dart';
import '../cart page/widgets/productCartItem.dart';

class OrderDetailPage extends StatelessWidget {
  late Order orderData;
  OrderDetailPage(this.orderData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TopNavigation(
            left: Row(
              children: [
                Material(
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.keyboard_arrow_left)),
                ),
                Text("Chi tiết đơn hàng")
              ],
            ),
            isSearcher: false),
        Expanded(
            child: ListView(
          children: [
            Container(
                color: Theme.of(context).own().defaultContainerColor,
                padding: EdgeInsets.all(
                    Theme.of(context).own().defaultVerticalPaddingOfScreen),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.delivery_dining),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                Theme.of(context).own().defaultMarginBetween),
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
            Container(
              color: Theme.of(context).own().defaultContainerColor,
              margin: EdgeInsets.only(
                  bottom: Theme.of(context).own().defaultProductCardMargin),
              padding: EdgeInsets.all(
                  Theme.of(context).own().defaultVerticalPaddingOfScreen),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/icons8_marker.png",
                    width: 48,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text("Địa chỉ nhận hàng",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "${orderData.address.firstName} ${orderData.address.lastName}|${orderData.address.phone}"),
                        Text(
                          "${orderData.address.addressDetail}, ${orderData.address.ward}, ${orderData.address.district}, ${orderData.address.city}",
                          maxLines: 3,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(
                    vertical: Theme.of(context).own().defaultProductCardMargin),
                color: Theme.of(context).own().defaultContainerColor,
                padding: EdgeInsets.all(
                    Theme.of(context).own().defaultVerticalPaddingOfScreen),
                child: Column(
                  children: [
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
                  ],
                )),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: Theme.of(context).own().defaultProductCardMargin),
              color: Theme.of(context).own().defaultContainerColor,
              padding: EdgeInsets.all(
                  Theme.of(context).own().defaultVerticalPaddingOfScreen),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Đơn hàng số",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "#${orderData.iDInvoice}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Theme.of(context).own().defaultMarginBetween),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Đặt ngày"), Text(orderData.createdOn)],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Trả tiền bởi"),
                      Text("Thanh toán khi nhận hàng")
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Theme.of(context).own().defaultContainerColor,
              padding: EdgeInsets.all(
                  Theme.of(context).own().defaultVerticalPaddingOfScreen),
              margin: EdgeInsets.symmetric(
                  vertical: Theme.of(context).own().defaultProductCardMargin),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tổng tiền"),
                      Text(currencyFormat(orderData.totalValue))
                    ],
                  ),
                  SizedBox(
                    height: Theme.of(context).own().defaultProductCardMargin,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Phí vận chuyển"), Text(currencyFormat(0))],
                  ),
                  SizedBox(
                    height: Theme.of(context).own().defaultProductCardMargin,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Mã giảm giá"), Text(currencyFormat(100))],
                  ),
                  SizedBox(
                    height: Theme.of(context).own().defaultProductCardMargin,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tổng tiền",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        currencyFormat(orderData.totalValue),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     OutlinedButton(
            //       onPressed: () {},
            //       child: const Text(
            //         "Mua lại",
            //         style: TextStyle(
            //           color: Colors.redAccent,
            //         ),
            //       ),
            //       style: OutlinedButton.styleFrom(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //         side: const BorderSide(
            //           color: Colors.redAccent,
            //         ),
            //       ),
            //     ),
            //     if (orderData.iDTracking == 4)
            //       Row(
            //         children: [
            //           SizedBox(
            //               width: Theme.of(context).own().defaultMarginBetween),
            //           OutlinedButton(
            //             onPressed: () {},
            //             child: const Text(
            //               "Đánh giá",
            //               style: TextStyle(
            //                 color: Colors.redAccent,
            //               ),
            //             ),
            //             style: OutlinedButton.styleFrom(
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10.0),
            //               ),
            //               side: const BorderSide(
            //                 color: Colors.redAccent,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     if (orderData.iDTracking == 1 || orderData.iDTracking == 2)
            //       Row(
            //         children: [
            //           SizedBox(
            //               width: Theme.of(context).own().defaultMarginBetween),
            //           OutlinedButton(
            //             onPressed: () {},
            //             style: OutlinedButton.styleFrom(
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10.0),
            //               ),
            //               side: const BorderSide(
            //                 color: Colors.redAccent,
            //               ),
            //             ),
            //             child: const Text(
            //               "Hủy đơn",
            //               style: TextStyle(
            //                 color: Colors.redAccent,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //   ],
            // )
          ],
        )),
      ],
    )));
  }
}
