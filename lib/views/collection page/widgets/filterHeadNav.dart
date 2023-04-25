import 'package:flutter/material.dart';

Future filterHeadNav(context) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sắp xếp"),
                      Row(
                        children: const [
                          Text("A-Z"),
                          Text("Theo giá tăng dần"),
                        ],
                      ),
                      Row(children: [Text("A-Z"), Text("Theo giá tăng dần")])
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Lọc"),
                      Column(
                        children: [Text("Khoảng giá")],
                      ),
                      Column(
                        children: [Text("Nhãn hàng")],
                      ),
                      Column(
                        children: [Text("Công dụng")],
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
}
