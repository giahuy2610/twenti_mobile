import 'package:flutter/material.dart';
import 'package:twenti_mobile/models/product/product.dart';

import '../../common widgets/product_list_view/product list view.dart';
import '../../common widgets/product_list_view/productListViewSkeleton.dart';
import '../../common widgets/top navigation/topNavigation.dart';
import '../../services/shared preferences/sharedPreferences.dart';
import 'controllers/futureFetchAllProduct.dart';

class ViewRecentsPage extends StatefulWidget {
  const ViewRecentsPage({Key? key}) : super(key: key);

  @override
  State<ViewRecentsPage> createState() => _ViewRecentsPageState();
}

class _ViewRecentsPageState extends State<ViewRecentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TopNavigation(
          left: Row(
            children: [
              Material(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.keyboard_arrow_left)),
              ),
              Text(
                "Đã xem gần đây",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          isSearcher: false,
        ),
        Expanded(
            child: SingleChildScrollView(
          child: FutureBuilder(
              future: SharedPreferencesObject().futureGetViewProductHistory(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<int>?> snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!;
                  print(data);
                  return FutureBuilder<List<Product>?>(
                    future: fetchAllProduct(data),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data!);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [productListView(snapshot.data!, true)],
                        );
                      } else {
                        return productListViewSkeleton();
                      }
                    },
                  );
                } else {
                  return productListViewSkeleton();
                }
              }),
        ))
      ],
    )));
  }
}
