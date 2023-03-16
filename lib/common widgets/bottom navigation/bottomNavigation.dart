import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigation extends StatelessWidget {
  List<Map<String, String>> navList = [
    {
      "title": "Trang chủ",
      "iconPath": "assets/icons/Send.svg",
      "routePath": ""
    },
    {"title": "Danh mục", "iconPath": "assets/icons/Send.svg", "routePath": ""},
    {"title": "Tin nhắn", "iconPath": "assets/icons/Send.svg", "routePath": ""},
    {"title": "Giỏ hàng", "iconPath": "assets/icons/Send.svg", "routePath": ""},
    {"title": "Tài khoản", "iconPath": "assets/icons/Send.svg", "routePath": ""}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Colors.red),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i in navList)
              InkWell(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      i["iconPath"]!,
                    ),
                    Text(i["title"]!)
                  ],
                ),
              )
          ],
        ));
  }
}
