import 'package:flutter/material.dart';

class CouponSelectOverlay extends StatefulWidget {
  const CouponSelectOverlay({Key? key}) : super(key: key);

  @override
  State<CouponSelectOverlay> createState() => _CouponSelectOverlayState();
}

class _CouponSelectOverlayState extends State<CouponSelectOverlay> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nhập mã giảm giá"),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )),
                    TextButton(onPressed: () {}, child: Text('Áp dụng'))
                  ],
                ),
                SizedBox(height: 10),
                Text("Chọn mã giảm giá"),
                // ListView(
                //   children: [],
                // )
              ],
            )));
  }
}

Future openCouponOverlay(context) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CouponSelectOverlay());
}
