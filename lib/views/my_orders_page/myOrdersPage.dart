import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/my_orders_page/widgets/orderListView.dart';

import './trackingStatusConstrain.dart';
import '../../common widgets/top navigation/topNavigation.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

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
              Text("Đơn hàng của tôi"),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              ColoredBox(
                color: Theme.of(context).own().defaultContainerColor,
                child: TabBar(
                  indicatorColor: Colors.redAccent,
                  labelColor: Colors.redAccent,
                  unselectedLabelColor: Colors.black,
                  isScrollable: true,
                  controller: _tabController,
                  tabs: [
                    for (var i in statusList)
                      Tab(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text(i),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    for (var i in List.generate(7, (index) => index))
                      OrderListView(i)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    )));
  }
}
