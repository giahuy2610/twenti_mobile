import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twenti_mobile/views/product%20page/widgets/description.dart';
import 'package:twenti_mobile/views/product%20page/widgets/imageSlider.dart';
import 'package:twenti_mobile/views/product%20page/widgets/productHeading.dart';
import 'package:twenti_mobile/views/product%20page/widgets/reviews.dart';

import '../../common widgets/top navigation/topNavigation.dart';
import '../../models/product/product.dart';
import '../../services/deep linking/deepLink.dart';
import '../cart page/cartPage.dart';
import 'controllers/futureGetProduct.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TopNavigation(
          left: Material(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.keyboard_arrow_left)),
          ),
          stepRight: Material(
              child: IconButton(
                  onPressed: () => CreateSharingDynamicLink(65),
                  icon: SvgPicture.asset('assets/icons/Send.svg'))),
          right: Material(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => CartPage()));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined))),
        ),
        Expanded(
            child: FutureBuilder<Product>(
                future: futureGetProduct(53050323),
                builder: (builder, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!;
                    return Container(
                      height: 500,
                      child: ListView(
                        children: [
                          productImagesSlider(data.images!),
                          productHeading(
                            nameProduct: data.nameProduct,
                            nameBrand: data.brand!.nameBrand!,
                            idBrand: data.idBrand,
                            categoryName: data.nameProduct,
                          ),
                          reviews(data.reviews!),
                          description(data.description!)
                        ],
                      ),
                    );
                  } else {
                    return Text("colection being loaded");
                  }
                })),
      ],
    )));
  }
}
