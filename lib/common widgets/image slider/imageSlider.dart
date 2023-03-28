import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:twenti_mobile/models/image_slider/image_slider.dart';
import 'package:twenti_mobile/views/product%20page/productPage.dart';

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

  // late List<Map<String, Object>> child = [
  //   {
  //     "IDImage": 1,
  //     "StartOn": "2022-12-05",
  //     "EndOn": "2025-12-19",
  //     "Path":
  //         "https://image.hsv-tech.io/1920x0/tfs/common/5e1e5fb5-8cc3-4da9-94c1-4bd9f9e55a79.webp",
  //     "Route": "/collection/1",
  //     "IsDeleted": 0,
  //     "CreatedOn": "2022-12-05"
  //   },
  //   {
  //     "IDImage": 2,
  //     "StartOn": "2022-12-05",
  //     "EndOn": "2027-12-16",
  //     "Path":
  //         "https://image.hsv-tech.io/1920x0/tfs/common/d7ba21cd-a534-41fb-ab78-7e72d12b8c05.webp",
  //     "Route": "/collection/1",
  //     "IsDeleted": 0,
  //     "CreatedOn": "2022-12-05"
  //   },
  //   {
  //     "IDImage": 3,
  //     "StartOn": "2022-12-05",
  //     "EndOn": "2027-12-24",
  //     "Path":
  //         "https://image.hsv-tech.io/1920x0/tfs/common/9de5f6bd-3dad-4a05-b006-7a992e181089.webp",
  //     "Route": "/collection/1",
  //     "IsDeleted": 0,
  //     "CreatedOn": "2022-12-05"
  //   },
  //   {
  //     "IDImage": 4,
  //     "StartOn": "2022-12-24",
  //     "EndOn": "2026-12-31",
  //     "Path":
  //         "https://image.hsv-tech.io/1920x0/tfs/common/5921e9a3-728b-42db-8e02-3cc7b21f35d8.webp",
  //     "Route": "/collection/1",
  //     "IsDeleted": 0,
  //     "CreatedOn": "2022-12-24"
  //   }
  // ];

  // imageSlider({required this.child});
  @override
  Widget build(BuildContext context) => Stack(children: <Widget>[
        CarouselSlider(
          items: [
            for (var i in child)
              InkWell(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ProductPage())),
                child: Image.network(
                  i.path.toString(),
                  fit: BoxFit.fill,
                ),
              ),
          ],
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: true,
            // enlargeCenterPage: true,
            viewportFraction: 0.95,
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
