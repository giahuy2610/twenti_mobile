import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/my_orders_page/controllers/futureGetOrdersByStatus.dart';
import 'package:twenti_mobile/views/my_orders_page/widgets/orderCard.dart';

import 'orderCardSkeleton.dart';

class OrderListView extends StatefulWidget {
  late int orderStatus;
  OrderListView(this.orderStatus);

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: futureGetOrderByStatus(widget.orderStatus),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          if (data.length > 0)
            return ListView(
              padding: EdgeInsets.symmetric(
                  vertical: Theme.of(context).own().defaultProductCardMargin),
              children: [
                for (var i in data.reversed) OrderCard(i),
              ],
            );
          else
            return Center(
              child: Image.asset(
                "assets/icons/icon_empty.png",
              ),
            );
        } else {
          return ListView(
            padding: EdgeInsets.symmetric(
                vertical: Theme.of(context).own().defaultProductCardMargin),
            children: [
              for (var i in List.generate(5, (index) => index))
                OrderCardSkeleton()
            ],
          );
        }
      },
    ));
  }
}
