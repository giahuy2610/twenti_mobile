import 'package:flutter/material.dart';
import 'package:twenti_mobile/common%20widgets/product%20card/productCard.dart';
import 'package:twenti_mobile/views/home%20page/widgets/timeCounter.dart';

import '../../../models/product/collection.dart';
import '../../collection page/controllers/futureGetCollection.dart';

class flashSaleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          children: [
            Row(
              children: [Text("Flash sale"), timeCounter(), Text("Xem thêm")],
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
        ));
  }
}
