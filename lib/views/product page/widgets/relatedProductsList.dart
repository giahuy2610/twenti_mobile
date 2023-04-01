import 'package:flutter/material.dart';

class relatedProductsList extends StatelessWidget {
  const relatedProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Có thể bạn cũng thích"),
        // productListView(productList)
      ]),
    );
  }
}
