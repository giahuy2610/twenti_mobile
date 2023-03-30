import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:twenti_mobile/models/image_slider/image_slider.dart';

import '../../views/collection page/collectionPage.dart';

class imageSlider extends StatefulWidget {
  late List<ImageSlider> child;

  imageSlider(this.child);

  @override
  State<imageSlider> createState() => _imageSliderState(child);
}

class _imageSliderState extends State<imageSlider> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;
  late List<ImageSlider> child;

  _imageSliderState(List<ImageSlider> this.child);

  @override
  Widget build(BuildContext context) => Stack(children: <Widget>[
        CarouselSlider(
          items: [
            for (var i in child)
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CollectionPage())),
                child: Image.network(
                  i.path.toString(),
                  fit: BoxFit.fill,
                ),
              ),
          ],
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            // aspectRatio: 2.0,
            initialPage: 2,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: child.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => buttonCarouselController.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ),
      ]);
}
