import 'package:flutter/material.dart';

import '../../../models/notification/notification.dart';

class notificationItem extends StatefulWidget {
  NotificationItemModel notiData;
  final Key key;
  late bool isRead;

  notificationItem(this.key, this.notiData) {
    this.isRead = notiData.getIsRead;
  }

  @override
  State<notificationItem> createState() => _notificationItemState();
}

class _notificationItemState extends State<notificationItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.isRead == false) {
          setState(() {
            widget.isRead = true;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: widget.isRead == true ? Colors.grey : Colors.white),
        child: Row(
          children: [
            Image.asset("assets/icons/icons8_notification.png"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.notiData.content),
                Text(widget.notiData.receivedTime.toString())
              ],
            )
          ],
        ),
      ),
    );
  }
}
