import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';

import '../../../common widgets/product card/productCard.dart';
import '../../../models/product/collection.dart';
import '../../collection page/controllers/futureGetCollection.dart';

class flashSaleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
          margin: EdgeInsets.all(
              Theme.of(context).own().defaultVerticalPaddingOfScreen),
          padding: EdgeInsets.all(
              Theme.of(context).own().defaultVerticalPaddingOfScreen),
          decoration: BoxDecoration(
              color: Colors.tealAccent,
              borderRadius: BorderRadius.circular(40)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    "https://image.hsv-tech.io/800x0/tfs/common/f5c3203e-ccaa-4394-8a0e-d148ee18cfc0.webp",
                    width: 150,
                  ),
                ],
              ),
              Expanded(
                child: FutureBuilder<Collection>(
                    future: futureGetCollection(65),
                    builder: (builder, snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (var i in snapshot.data!.products)
                                productCard(i)
                            ]);
                      } else {
                        return Container();
                      }
                    }),
              )
            ],
          )),
    );
  }
}
