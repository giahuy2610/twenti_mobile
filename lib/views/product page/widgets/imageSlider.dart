import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:twenti_mobile/models/product/image.dart';

class productImagesSlider extends StatefulWidget {
  late List<ImageModel> imageList;

  productImagesSlider(this.imageList);

  @override
  State<productImagesSlider> createState() =>
      _productImagesSliderState(imageList);
}

class _productImagesSliderState extends State<productImagesSlider> {
  late List<ImageModel> imageList;
  _productImagesSliderState(this.imageList);

  @override
  Widget build(BuildContext context) => Stack(children: <Widget>[
        CarouselSlider(
          items: [
            for (var i in imageList)
              Image.network(
                i.path!,
                fit: BoxFit.fill,
              ),
          ],
          // carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: true,
            // enlargeCenterPage: true,
            viewportFraction: 0.95,
            // aspectRatio: 2.0,
            initialPage: 2,
            // onPageChanged: (index, reason) {
            //   setState(() {
            //     _current = index;
            //   });
            // },
          ),
        ),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: child.asMap().entries.map((entry) {
        //       return GestureDetector(
        //         onTap: () => buttonCarouselController.animateToPage(entry.key),
        //         child: Container(
        //           width: 12.0,
        //           height: 12.0,
        //           margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        //           decoration: BoxDecoration(
        //               shape: BoxShape.circle,
        //               color: (Theme.of(context).brightness == Brightness.dark
        //                   ? Colors.white
        //                   : Colors.black)
        //                   .withOpacity(_current == entry.key ? 0.9 : 0.4)),
        //         ),
        //       );
        //     }).toList(),
        //   ),
        // ),
      ]);
}
