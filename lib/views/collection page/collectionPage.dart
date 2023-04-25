import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twenti_mobile/common%20widgets/cart_icon/cartIcon.dart';
import 'package:twenti_mobile/common%20widgets/product_list_view/product%20list%20view.dart';
import 'package:twenti_mobile/common%20widgets/product_list_view/productListViewSkeleton.dart';
import 'package:twenti_mobile/models/product/collection.dart';
import 'package:twenti_mobile/views/collection%20page/widgets/filterHeadNav.dart';

import '../../common widgets/top navigation/topNavigation.dart';
import '../../models/product/product.dart';

class CollectionPage extends StatefulWidget {
  dynamic function;
  CollectionPage(this.function);

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Column(
        children: [
          TopNavigation(
            isSearcher: true,
            left: Material(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.keyboard_arrow_left)),
            ),
            stepRight: InkWell(
              onTap: () {
                filterHeadNav(context);
              },
              child: SvgPicture.asset('assets/icons/Filter.svg'),
            ),
            right: cartIcon(),
          ),
          Expanded(
              child: ListView(
            children: [
              FutureBuilder(
                  future: widget.function,
                  builder: (builder, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data!;
                      if (data is Collection) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.nameCollection),
                            productListView(data.products)
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [productListView(data as List<Product>)],
                        );
                      }
                    } else {
                      return productListViewSkeleton();
                    }
                  })
            ],
          )),
        ],
      )
    ])));
  }
}
