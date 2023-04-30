import 'package:flutter/material.dart';
import 'package:twenti_mobile/models/product/product.dart';
import 'package:twenti_mobile/views/product%20page/controllers/futureGetProduct.dart';

import '../../common widgets/product_list_view/product list view.dart';
import '../../common widgets/product_list_view/productListViewSkeleton.dart';
import '../../common widgets/top navigation/topNavigation.dart';
import '../../services/shared preferences/sharedPreferences.dart';

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
          left: Text("Đã xem gần đây"),
          right: IconButton(
            onPressed: () {},
            icon: Icon(Icons.restore_from_trash),
          ),
        ),
        FutureBuilder(
            future: SharedPreferencesObject().futureGetViewProductHistory(),
            builder:
                (BuildContext context, AsyncSnapshot<List<int>?> snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!;
                List<Product> listProduct = <Product>[];
                for (var id in data)
                  futureGetProduct(id).then((value) => listProduct.add(value));

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [productListView(listProduct, true)],
                );
              } else {
                return productListViewSkeleton();
              }
            })
      ],
    )));
  }
}
