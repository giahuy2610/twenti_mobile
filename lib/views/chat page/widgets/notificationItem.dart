import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:twenti_mobile/themes/theme.dart';

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
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: widget.isRead == true
                    ? Colors.white
                    : Color.fromRGBO(255, 251, 235, 1),
                border: Border.all(color: Color.fromRGBO(233, 222, 228, 1))),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      margin: EdgeInsets.only(
                          right: Theme.of(context).own().defaultMarginBetween,
                          bottom: Theme.of(context).own().defaultMarginBetween),
                      child: Image.network(""),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.notiData.content),
                        Text(DateFormat.yMd()
                            .add_jm()
                            .format(widget.notiData.receivedTime))
                      ],
                    )
                  ],
                ),
                const Text(
                  "nfobfofbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
                  maxLines: 5,
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                )
              ],
            ),
          ),
          if (widget.isRead != true)
            Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(500)),
            )
        ],
      ),
    );
  }
}
