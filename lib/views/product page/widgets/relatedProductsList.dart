import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';

class relatedProductsList extends StatelessWidget {
  const relatedProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(
          Theme.of(context).own().defaultVerticalPaddingOfScreen),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "recommendations".tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        // productListView(productList)
      ]),
    );
  }
}
