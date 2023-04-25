import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:skeletons/skeletons.dart';
import 'package:twenti_mobile/common%20widgets/product_list_view/product%20list%20view.dart';
import 'package:twenti_mobile/common%20widgets/product_list_view/productListViewSkeleton.dart';
import 'package:twenti_mobile/views/home%20page/widgets/flashSaleBox.dart';
import 'package:twenti_mobile/views/qr_scanner_page/qrScannerPage.dart';

import '../../common widgets/cart_icon/cartIcon.dart';
import '../../common widgets/image slider/imageSlider.dart';
import '../../common widgets/top navigation/topNavigation.dart';
import '../../models/image_slider/image_slider.dart';
import '../../models/product/collection.dart';
import '../collection page/controllers/futureGetCollection.dart';
import '../product page/productPage.dart';
import 'controllers/futureGetImageSliderCollection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

  void initDynamicLinks() async {
    // Check if you received the link via `getInitialLink` first
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    if (initialLink != null) {
      final Uri deepLink = initialLink.link;
      // Example of using the dynamic link to push the user to a different screen
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductPage(65)));
    }

    FirebaseDynamicLinks.instance.onLink.listen(
      (pendingDynamicLinkData) {
        // Set up the `onLink` event listener next as it may be received here
        if (pendingDynamicLinkData != null) {
          final Uri deepLink = pendingDynamicLinkData.link;
          // Example of using the dynamic link to push the user to a different screen
          Navigator.pushNamed(context, deepLink.path);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TopNavigation(
          isSearcher: true,
          left: Material(
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: qrScannerPage(),
                          childCurrent: context.widget));
                },
                icon: const Icon(Icons.qr_code_scanner_outlined)),
          ),
          right: cartIcon(),
        ),
        Expanded(
            child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 9 / 16,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(50)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black45.withOpacity(0.1),
                      blurRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ]),
              child: FutureBuilder<List<ImageSlider>>(
                  future: futureGetImageSliderCollection(),
                  builder: (builder, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                          width: double.infinity,
                          child: imageSlider(snapshot.data!));
                    } else {
                      return const SizedBox(
                          width: double.infinity,
                          child: SkeletonAvatar(
                            style:
                                SkeletonAvatarStyle(shape: BoxShape.rectangle),
                          ));
                    }
                  }),
            ),
            flashSaleBox(),
            FutureBuilder<Collection>(
                future: futureGetCollection(65),
                builder: (builder, snapshot) {
                  if (snapshot.hasData) {
                    return productListView(snapshot.data!.products);
                  } else {
                    return productListViewSkeleton();
                  }
                })
          ],
        )),
      ],
    )));
  }
}
