import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';
import 'package:twenti_mobile/common%20widgets/sale_percent_badge/salePercentBadge.dart';
import 'package:twenti_mobile/views/product%20page/widgets/description.dart';
import 'package:twenti_mobile/views/product%20page/widgets/imageSlider.dart';
import 'package:twenti_mobile/views/product%20page/widgets/productHeading.dart';
import 'package:twenti_mobile/views/product%20page/widgets/relatedProductsList.dart';
import 'package:twenti_mobile/views/product%20page/widgets/reviews.dart';

import '../../common widgets/top navigation/topNavigation.dart';
import '../../models/product/product.dart';
import '../../services/deep linking/deepLink.dart';
import '../cart page/cartPage.dart';
import 'controllers/futureGetProduct.dart';

class ProductPage extends StatelessWidget {
  final int idProduct;

  ProductPage(this.idProduct);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product>(
        future: futureGetProduct(idProduct),
        builder: (builder, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            var salePercent =
                (100 - data.retailPrice / data.listPrice * 100).toInt();
            return Scaffold(
                backgroundColor: Color.fromRGBO(249, 249, 249, 1),
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
                              onPressed: () =>
                                  CreateSharingDynamicLink(idProduct),
                              icon: SvgPicture.asset('assets/icons/Send.svg'))),
                      right: Material(
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => CartPage()));
                              },
                              icon: const Icon(Icons.shopping_bag_outlined))),
                    ),
                    Expanded(
                        child: Container(
                      height: 500,
                      child: ListView(
                        children: [
                          productImagesSlider(data.images!),
                          productHeading(
                            nameProduct: data.nameProduct,
                            nameBrand: data.brand!.nameBrand,
                            idBrand: data.idBrand,
                            categoryName: data.nameProduct,
                          ),
                          reviews(data.reviews!),
                          description(data.description!),
                          relatedProductsList()
                        ],
                      ),
                    )),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(250, 239, 239, 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    data.retailPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(255, 49, 49, 1)),
                                  ),
                                  Text(
                                    data.listPrice.toString(),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough),
                                  )
                                ],
                              ),
                              salePercent != 0
                                  ? Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: salePercentBadge(salePercent))
                                  : Text("")
                            ],
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(500)),
                            child: const Text(
                              "Thêm vào giỏ",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )));
          } else {
            return RiveAnimation.asset('assets/icons/delivery.riv');
          }
        });
  }
}
