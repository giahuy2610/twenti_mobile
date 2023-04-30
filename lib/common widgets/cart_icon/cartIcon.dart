import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:twenti_mobile/views/checkout%20pape/checkoutPage.dart';

import '../../providers/cartProvider.dart';

class cartIcon extends StatelessWidget {
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  var _cartQuantityItems = 0;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.custom(top: 4, end: 6),
      showBadge: context.watch<CartProvider>().numOfProducts > 0,
      badgeContent:
          Text(context.watch<CartProvider>().numOfProducts.toString()),
      child: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    child: checkoutPage(),
                    childCurrent: this));
          },
          icon: Icon(Icons.shopping_bag_outlined)),
    );
  }
}
