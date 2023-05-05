import 'package:flutter/material.dart';
import 'package:twenti_mobile/models/notification/notification.dart';
import 'package:twenti_mobile/views/chat%20page/widgets/notificationItem.dart';

import '../../common widgets/top navigation/topNavigation.dart';
import '../../services/chat/chat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  void test() {}

  @override
  void initState() {
    super.initState();
    newChat;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TopNavigation(
          left: Text("Thông báo"),
          right: IconButton(
            onPressed: () {},
            icon: Icon(Icons.restore_from_trash),
          ),
          isSearcher: false,
        ),
        Expanded(
            child: ListView(
          padding: EdgeInsets.all(10),
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
