import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:twenti_mobile/common%20widgets/sale_percent_badge/salePercentBadge.dart';
import 'package:twenti_mobile/providers/cartProvider.dart';
import 'package:twenti_mobile/views/cart%20page/controllers/futureAddToCart.dart';
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

class topW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('ưi');
    return TopNavigation(
      left: Material(
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_arrow_left)),
      ),
      stepRight: Material(
          child: IconButton(
              onPressed: () => CreateSharingDynamicLink(1),
              icon: SvgPicture.asset('assets/icons/Send.svg'))),
      right: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -10, end: -12),
        showBadge: true,
        // ignorePointer: false,
        // onTap: () {},
        // badgeAnimation: const badges.BadgeAnimation.rotation(
        //   animationDuration: Duration(seconds: 1),
        //   colorChangeAnimationDuration: Duration(seconds: 1),
        //   loopAnimation: false,
        //   curve: Curves.fastOutSlowIn,
        //   colorChangeAnimationCurve: Curves.easeInCubic,
        // ),
        // badgeStyle: badges.BadgeStyle(
        //   shape: badges.BadgeShape.square,
        //   badgeColor: Colors.blue,
        //   padding: const EdgeInsets.all(5),
        //   borderRadius: BorderRadius.circular(4),
        //   borderSide:
        //       const BorderSide(color: Colors.white, width: 2),
        //   borderGradient: const badges.BadgeGradient.linear(
        //       colors: [Colors.red, Colors.black]),
        //   badgeGradient: const badges.BadgeGradient.linear(
        //     colors: [Colors.blue, Colors.yellow],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //   ),
        //   elevation: 0,
        // ),
        badgeContent:
            Text(context.watch<CartProvider>().numOfProducts.toString()),
        child: Material(
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CartPage()));
                },
                icon: const Icon(Icons.shopping_bag_outlined))),
      ),
    );
  }
}

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
                    topW(),
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
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(255, 49, 49, 1)),
                                  ),
                                  data.listPrice != data.retailPrice
                                      ? Text(
                                          data.listPrice.toString(),
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        )
                                      : Container()
                                ],
                              ),
                              salePercent != 0
                                  ? Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: salePercentBadge(salePercent))
                                  : Container()
                            ],
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(500)),
                            child: InkWell(
                              onTap: () async {
                                context.read<CartProvider>().saveCartProducts(
                                    await futureAddToCart(idProduct, 1));
                              },
                              child: const Text(
                                "Thêm vào giỏ",
                                style: TextStyle(color: Colors.white),
                              ),
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
