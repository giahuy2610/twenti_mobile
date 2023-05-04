import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:twenti_mobile/common%20widgets/cart_icon/cartIcon.dart';
import 'package:twenti_mobile/common%20widgets/description/description.dart';
import 'package:twenti_mobile/common%20widgets/sale_percent_badge/salePercentBadge.dart';
import 'package:twenti_mobile/providers/cartProvider.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/cart%20page/controllers/futureAddToCart.dart';
import 'package:twenti_mobile/views/product%20page/widgets/imageSlider.dart';
import 'package:twenti_mobile/views/product%20page/widgets/productHeading.dart';
import 'package:twenti_mobile/views/product%20page/widgets/relatedProductsList.dart';
import 'package:twenti_mobile/views/product%20page/widgets/reviews.dart';

import '../../common widgets/top navigation/topNavigation.dart';
import '../../models/product/product.dart';
import '../../services/currency_format/currencyFormat.dart';
import '../../services/deep linking/deepLink.dart';
import '../../services/shared preferences/sharedPreferences.dart';
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
        right: cartIcon());
  }
}

class ProductPage extends StatelessWidget {
  final int idProduct;

  ProductPage(this.idProduct);

  @override
  Widget build(BuildContext context) {
    //add product to products view recent history
    SharedPreferencesObject().saveViewProductHistory(idProduct);

    return FutureBuilder<Product>(
        future: futureGetProduct(idProduct),
        builder: (builder, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            var salePercent =
                (100 - data.retailPrice / data.listPrice * 100).toInt();
            return Scaffold(
                body: SafeArea(
                    child: Column(
              children: [
                topW(),
                Expanded(
                    child: Container(
                  height: 500,
                  child: ListView(
                    children: [
                      Hero(
                          tag:
                              "hero_product_image_" + data.idProduct.toString(),
                          child: productImagesSlider(data.images!)),
                      productHeading(
                        nameProduct: data.nameProduct,
                        nameBrand: data.brand!.nameBrand,
                        idBrand: data.idBrand,
                        categoryName: data.nameProduct,
                      ),
                      reviews(data.reviews!),
                      Container(
                        padding: EdgeInsets.all(Theme.of(context)
                            .own()
                            .defaultVerticalPaddingOfScreen),
                        color: Theme.of(context).own().defaultContainerColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mô tả sản phẩm",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            description(data.description!),
                          ],
                        ),
                      ),
                      relatedProductsList()
                    ],
                  ),
                )),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: Theme.of(context)
                          .own()
                          .defaultVerticalPaddingOfScreen),
                  decoration: BoxDecoration(
                      color: Theme.of(context).own().defaultContainerColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).own().defaultScaffoldColor,
                            spreadRadius: 1)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  currencyFormat(data.retailPrice),
                                  style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .own()
                                          .retailPriceSize,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .own()
                                          .retailPriceColor),
                                ),
                                data.listPrice != data.retailPrice
                                    ? Text(
                                        currencyFormat(data.listPrice),
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
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Material(
                            //   child: InkWell(
                            //     onTap: () async {
                            //       context.read<CartProvider>().saveCartProducts(
                            //           await futureAddToCart(
                            //               context, idProduct, 1));
                            //     },
                            //     child: Container(
                            //       height: 50,
                            //       alignment: Alignment.center,
                            //       padding: EdgeInsets.all(5),
                            //       decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(50),
                            //           color: Color.fromRGBO(244, 163, 155, 0.4),
                            //           border:
                            //               Border.all(color: Colors.redAccent)),
                            //       child: const Text(
                            //         "MUA NGAY",
                            //         style: TextStyle(
                            //             color: Colors.redAccent,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              width: 5,
                            ),
                            Material(
                              child: InkWell(
                                onTap: () async {
                                  context.read<CartProvider>().saveCartProducts(
                                      await futureAddToCart(
                                          context, idProduct, 1));
                                },
                                child: Container(
                                  height: 50,
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.red.shade400,
                                      borderRadius: BorderRadius.circular(500)),
                                  child: const Text(
                                    "THÊM VÀO GIỎ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
