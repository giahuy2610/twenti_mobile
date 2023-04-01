import 'package:flutter/material.dart';
import 'package:twenti_mobile/common%20widgets/product_list_view/product%20list%20view.dart';
import 'package:twenti_mobile/models/product/collection.dart';
import 'package:twenti_mobile/views/collection%20page/controllers/futureGetCollection.dart';

import '../../common widgets/top navigation/topNavigation.dart';
import '../cart page/cartPage.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TopNavigation(
          right: Material(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => CartPage()));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined))),
        ),
        Expanded(
            child: ListView(
          children: [
            FutureBuilder<Collection>(
                future: futureGetCollection(65),
                builder: (builder, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.nameCollection),
                        productListView(data.products)
                      ],
                    );
                  } else
                    return Text("loading");
                })
          ],
        )),
      ],
    )));
  }
}
