import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:twenti_mobile/common%20widgets/product_list_view/product%20list%20view.dart';

import '../../common widgets/image slider/imageSlider.dart';
import '../../common widgets/top navigation/topNavigation.dart';
import '../../models/image_slider/image_slider.dart';
import '../../models/product/collection.dart';
import '../cart page/cartPage.dart';
import '../product page/productPage.dart';
import 'controllers/futureGetCollection.dart';
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
          right: Material(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => CartPage()));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined))),
        ),
        Expanded(
            child: ListView(
          children: [
            FutureBuilder<List<ImageSlider>>(
                future: futureGetImageSliderCollection(),
                builder: (builder, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 9 / 16,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black45.withOpacity(0.1),
                              blurRadius: 1,
                              offset: Offset(0, 2),
                            ),
                          ]),
                      child: SizedBox(
                          width: double.infinity,
                          child: imageSlider(snapshot.data!)),
                    );
                  } else {
                    return Text("loading");
                  }
                }),
            FutureBuilder<Collection>(
                future: futureGetCollection(65),
                builder: (builder, snapshot) {
                  if (snapshot.hasData) {
                    return productListView(snapshot.data!.products);
                  } else {
                    return Text("colection being loaded");
                  }
                })
          ],
        )),
      ],
    )));
  }
}
