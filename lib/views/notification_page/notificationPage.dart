import 'package:flutter/material.dart';
import 'package:twenti_mobile/models/notification/notification.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/notification_page/widgets/notificationItem.dart';

import '../../common widgets/top navigation/topNavigation.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TopNavigation(
          left:
              Text("Thông báo", style: Theme.of(context).textTheme.titleMedium),
          right: TextButton(
            onPressed: () {},
            child: Text("Đọc tất cả (1)"),
          ),
          isSearcher: false,
        ),
        Expanded(
            child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal:
                  Theme.of(context).own().defaultVerticalPaddingOfScreen,
              vertical:
                  Theme.of(context).own().defaultVerticalPaddingOfScreen / 2),
          children: [
            for (var i in List.generate(5, (index) => index + 10))
              notificationItem(
                  Key(i.toString()),
                  NotificationItemModel(
                      content: "hehe", receivedTime: DateTime.now()))
          ],
        )),
      ],
    )));
  }
}
