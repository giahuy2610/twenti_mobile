import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/models/product/image.dart';
import 'package:twenti_mobile/views/view_image_page/viewImagePage.dart';

class productImagesSlider extends StatefulWidget {
  late List<ImageModel> imageList;

  productImagesSlider(this.imageList);

  @override
  State<productImagesSlider> createState() =>
      _productImagesSliderState(imageList);
}

class _productImagesSliderState extends State<productImagesSlider> {
  late List<ImageModel> imageList;
  int _current = 0;
  CarouselController buttonCarouselController = CarouselController();
  _productImagesSliderState(this.imageList);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(color: Colors.white),
        height: MediaQuery.of(context).size.width * 9 / 16,
        child: Stack(children: <Widget>[
          CarouselSlider(
            items: [
              for (var i in imageList)
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: viewImagePage(imageList, _current),
                          childCurrent: widget)),
                  child: Image.network(
                    i.path!,
                    fit: BoxFit.fill,
                  ),
                ),
            ],
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Text("${_current + 1}/${imageList.length}")),
        ]),
      );
}
