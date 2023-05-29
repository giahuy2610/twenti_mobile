import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/cart%20page/widgets/productCartItem.dart';
import 'package:twenti_mobile/views/cart%20page/widgets/productCartItemSkeleton.dart';

import '../../../models/product/cartProduct.dart';
import '../controllers/getCart.dart';

class ProductCartListView extends StatefulWidget {
  const ProductCartListView({Key? key}) : super(key: key);

  @override
  State<ProductCartListView> createState() => _ProductCartListViewState();
}

class _ProductCartListViewState extends State<ProductCartListView> {
  late var dataCart;

  void removeItem(int idProduct) {
    setState(() {
      print(dataCart.length);
      dataCart.removeWhere((e) => e.product.idProduct == idProduct);
      print(dataCart.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("set state");
    return FutureBuilder<List<CartProduct>>(
        future: getCart(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dataCart = snapshot.data!;
            return Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).own().defaultContainerColor),
              child: dataCart.length > 0
                  ? ListView(
                      padding: EdgeInsets.only(
                          right: Theme.of(context)
                              .own()
                              .defaultVerticalPaddingOfScreen),
                      children: [
                          for (var i in (dataCart))
                            ProductCartItem(
                                image: i.product.images!.first.path,
                                name: i.product.nameProduct,
                                id: i.product.idProduct,
                                price: i.product.retailPrice,
                                quantity: i.quantity,
                                removeFromChild: removeItem)
                        ])
                  : Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/icons/icon_empty.png",
                            scale: 0.7,
                          ),
                          Text(
                            "Bạn chưa lựa được món nào ưng ý hỏ?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
            );
          }
          return ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical:
                      Theme.of(context).own().defaultVerticalPaddingOfScreen),
              children: [
                for (var i = 0; i < 6; i++) productCartItemSkeleton()
              ]);
        });
  }
}
