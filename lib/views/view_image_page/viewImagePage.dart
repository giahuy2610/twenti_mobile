import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common widgets/top navigation/topNavigation.dart';
import '../../models/product/image.dart';
import '../../services/deep linking/deepLink.dart';
import '../cart page/cartPage.dart';

class viewImagePage extends StatefulWidget {
  late List<ImageModel> imageList;
  final int initImage;
  viewImagePage(this.imageList, this.initImage);

  @override
  State<viewImagePage> createState() => _viewImagePageState();
}

class _viewImagePageState extends State<viewImagePage> {
  // late List<ImageModel> imageList;
  // int initImage;
  CarouselController buttonCarouselController = CarouselController();
  _viewImagePageState();

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
          child: Stack(children: <Widget>[
            Center(
              child: Container(
                width: double.infinity,
                child: CarouselSlider(
                  items: [
                    for (var i in widget.imageList)
                      InteractiveViewer(
                        panEnabled:
                            false, // Set it to false to prevent panning.
                        minScale: 1,
                        maxScale: 4,
                        child: Image.network(
                          i.path!,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                  ],
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: double.infinity,
                    initialPage: widget.initImage,
                    // onPageChanged: (index, reason) {
                    //   setState(() {
                    //     _current = index;
                    //   });
                    // },
                  ),
                ),
              ),
            )
          ]),
        )
      ],
    )));
  }
}
