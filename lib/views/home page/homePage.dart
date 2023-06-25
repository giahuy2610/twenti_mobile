import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:skeletons/skeletons.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:twenti_mobile/common%20widgets/product_list_view/product%20list%20view.dart';
import 'package:twenti_mobile/common%20widgets/product_list_view/productListViewSkeleton.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/home%20page/widgets/flashSaleBox.dart';
import 'package:twenti_mobile/views/home%20page/widgets/switchCardsEvent.dart';
import 'package:twenti_mobile/views/qr_scanner_page/qrScannerPage.dart';

import '../../common widgets/cart_icon/cartIcon.dart';
import '../../common widgets/image slider/imageSlider.dart';
import '../../common widgets/top navigation/topNavigation.dart';
import '../../models/image_slider/image_slider.dart';
import '../../models/product/collection.dart';
import '../../services/shared preferences/sharedPreferences.dart';
import '../collection page/controllers/futureGetCollection.dart';
import '../product page/productPage.dart';
import 'controllers/futureGetImageSliderCollection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TargetFocus> targets = [];
  GlobalKey qrScanGlobalKey = GlobalKey();
  GlobalKey cartGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    initDynamicLinks();

    targets.add(TargetFocus(
        identify: "Target 1",
        keyTarget: qrScanGlobalKey,
        contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: Container(
                margin: EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "QR scanner",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "qrCoachGuide".tr(),
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ))
        ]));

    targets.add(
        TargetFocus(identify: "Target 2", keyTarget: cartGlobalKey, contents: [
      TargetContent(
          align: ContentAlign.left,
          child: Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "cart".tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "cartCoachGuide".tr(),
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )),
      TargetContent(
          align: ContentAlign.top,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Multiples content",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ))
    ]));
    //
    // targets.add(
    //     TargetFocus(identify: "Target 3", keyTarget: keyButton5, contents: [
    //   TargetContent(
    //       align: ContentAlign.right,
    //       child: Container(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Text(
    //               "Title lorem ipsum",
    //               style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.white,
    //                   fontSize: 20.0),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(top: 10.0),
    //               child: Text(
    //                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
    //                 style: TextStyle(color: Colors.white),
    //               ),
    //             )
    //           ],
    //         ),
    //       ))
    // ]));
  }

  void showTutorial() {
    TutorialCoachMark(
      targets: targets, // List<TargetFocus>
      colorShadow: Theme.of(context).primaryColor, // DEFAULT Colors.black
      // alignSkip: Alignment.bottomRight,
      textSkip: "skip".tr(),
      // paddingFocus: 10,
      // opacityShadow: 0.8,
      onClickTarget: (target) {
        print(target);
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        print("target: $target");
        print(
            "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print(target);
      },
      onSkip: () {
        print("skip");
      },
      onFinish: () {
        print("finish");
      },
    ).show(context: context);
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
    SharedPreferencesObject().getCoachGuideState().then((value) {
      if (value == false) {
        showTutorial();
        SharedPreferencesObject().saveCoachGuideState(true);
      }
    });

    return Scaffold(
        backgroundColor: Colors.white70,
        body: SafeArea(
            child: Column(
          children: [
            TopNavigation(
              isSearcher: true,
              left: Material(
                key: qrScanGlobalKey,
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
              right: Container(key: cartGlobalKey, child: cartIcon()),
            ),
            Expanded(
                child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(80)),
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
                                style: SkeletonAvatarStyle(
                                    shape: BoxShape.rectangle),
                              ));
                        }
                      }),
                ),
                flashSaleBox(15100),
                SwitchCardsEvent(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.symmetric(
                            horizontal: Theme.of(context)
                                .own()
                                .defaultVerticalPaddingOfScreen,
                            vertical: 4),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(244, 163, 155, 0.4),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Text(
                          "recommendations".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.red),
                        )),
                    FutureBuilder<Collection>(
                        future: futureGetCollection(65),
                        builder: (builder, snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Theme.of(context)
                                          .own()
                                          .defaultVerticalPaddingOfScreen -
                                      Theme.of(context)
                                          .own()
                                          .defaultProductCardMargin),
                              child: productListView(
                                  snapshot.data!.products, true),
                            );
                          } else {
                            return productListViewSkeleton();
                          }
                        }),
                  ],
                )
              ],
            )),
          ],
        )));
  }
}
