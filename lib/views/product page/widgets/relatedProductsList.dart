import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';

class relatedProductsList extends StatelessWidget {
  const relatedProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(
          Theme.of(context).own().defaultVerticalPaddingOfScreen),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Có thể bạn cũng thích",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        // productListView(productList)
      ]),
    );
  }
}
