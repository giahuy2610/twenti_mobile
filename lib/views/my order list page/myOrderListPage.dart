import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';

class MyOrderListPage extends StatefulWidget {
  const MyOrderListPage({Key? key}) : super(key: key);

  @override
  State<MyOrderListPage> createState() => _MyOrderListPageState();
}

class _MyOrderListPageState extends State<MyOrderListPage> {
  List<String> tabs = [
    "Tất cả",
    "Chờ xác nhận",
    "Đang chuẩn bị",
    "Đang giao hàng",
    "Đã giao hàng",
    "Không thành công",
    "Đã hủy"
  ];
  int current = 0;
  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 0;
      case 1:
        return 130;
      case 2:
        return 265;
      case 3:
        return 334;
      case 4:
        return 334;
      case 5:
        return 404;
      default:
        return 0;
    }
  }
  double changeContainerWidth() {
    switch (current) {
      case 0:
        return 125;
      case 1:
        return 130;
      case 2:
        return 130;
      case 3:
        return 130;
      case 4:
        return 150;
      case 5:
        return 130;
      default:
        return 0;
    }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_outlined),
        title: Text(
          "Đơn hàng của tôi",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xff6ae792),
                    width: 2.0,
                  )
                )
              ),              
              width: size.width,
              height: 50,
              child: Stack(
                children: [
                  Positioned(
                    top: 5,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: size.width,
                      height: size.height ,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: tabs.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: index == 0 ? 10 : 22, top: 7),
                                child: Text(
                                  tabs[index],
                                  style: TextStyle(
                                    fontSize: current == index ? 20 : 18,
                                    fontWeight: current == index
                                        ? FontWeight.w400
                                        : FontWeight.w300,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  // AnimatedPositioned(
                  //   bottom: 0,
                  //   //left: changePositionedOfLine(),
                  //   curve: Curves.fastLinearToSlowEaseIn,
                  //   duration: Duration(microseconds: 500),
                  //   child: AnimatedContainer(
                  //     margin: EdgeInsets.only(left: 10),
                  //     duration: const Duration(microseconds: 500),
                  //     width: changeContainerWidth(),
                  //     height: size.height * 0.008,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       color: Colors.green,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )
            ,Padding(
              padding: EdgeInsets.only(top: size.height * 0.4),
              child: Text("${tabs[current]} Tab Content"),
            )
          ],
        ),
      ),
    );
  }
}
