import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:twenti_mobile/common%20widgets/cart_icon/cartIcon.dart';
import 'package:twenti_mobile/common%20widgets/description/description.dart';
import 'package:twenti_mobile/common%20widgets/product_list_view/product%20list%20view.dart';
import 'package:twenti_mobile/common%20widgets/product_list_view/productListViewSkeleton.dart';
import 'package:twenti_mobile/models/product/collection.dart';
import 'package:twenti_mobile/views/collection%20page/widgets/filterHeadNav.dart';

import '../../common widgets/top navigation/topNavigation.dart';
import '../../models/product/product.dart';
import '../../providers/collectionPageProvider.dart';

class CollectionPage extends StatefulWidget {
  dynamic function;
  CollectionPage(this.function);

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  bool isGridView = true;

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
            stepRight: Row(
              children: [
                Material(
                    child: IconButton(
                  onPressed: () {
                    setState(() {
                      isGridView = !isGridView;
                    });
                  },
                  icon: SvgPicture.asset(isGridView
                      ? 'assets/icons/menu_grid.svg'
                      : 'assets/icons/menu_list.svg'),
                )),
                Material(
                    child: IconButton(
                  onPressed: () {
                    filterHeadNav(context);
                  },
                  icon: SvgPicture.asset('assets/icons/Filter.svg'),
                )),
              ],
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
                        context
                            .read<CollectionPageProvider>()
                            .setListOfProducts = (data.products);

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black45.withOpacity(0.3),
                                    blurRadius: 2,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.network(data.wallPaperPath!),
                            ),
                            Align(
                              child: Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color:
                                              Colors.black45.withOpacity(0.3),
                                          blurRadius: 2,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    transform: Matrix4.translationValues(
                                        0.0,
                                        -MediaQuery.of(context).size.width *
                                            0.15,
                                        0.0),
                                    child: Image.network(
                                      data.logoImagePath!,
                                    ),
                                  ),
                                  Text(
                                    data.nameCollection,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                            description(data.description!),
                            productListView(data.products, isGridView)
                          ],
                        );
                      } else {
                        context
                            .read<CollectionPageProvider>()
                            .setListOfProducts = (data as List<Product>);

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            productListView(data as List<Product>, isGridView)
                          ],
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
