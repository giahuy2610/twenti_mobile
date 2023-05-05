import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/views/category%20page/widgets/grid_item.dart';

import '../../common widgets/cart_icon/cartIcon.dart';
import '../../common widgets/top navigation/topNavigation.dart';
import '../qr_scanner_page/qrScannerPage.dart';

class CategoryPage extends StatelessWidget {
  final dataBrand = [
    {
      "IDCollection": "1",
      "NameCollection": "The Face Shop",
      "ImagePath":
          "https://image.hsv-tech.io/400x0/tfs/common/0c415e35-2448-4609-9a12-f34cf0304206.webp"
    },
    {
      "IDCollection": "65",
      "NameCollection": "CNP",
      "ImagePath":
          "https://image.hsv-tech.io/400x0/tfs/common/96fc96b3-a085-4040-8fae-efdc84f73275.webp"
    },
    {
      "IDCollection": "69",
      "NameCollection": "BELIF",
      "ImagePath":
          "https://image.hsv-tech.io/400x0/tfs/common/5db5ef7f-f44b-4344-b634-8951d9c67161.webp"
    },
    {
      "IDCollection": "70",
      "NameCollection": "YEHWADAM",
      "ImagePath":
          "https://image.hsv-tech.io/400x0/tfs/common/ef78ea2a-5c56-48bb-814c-b3e1bacc4bea.webp"
    },
  ];

  final dataCategory = [
    {
      'IDCollection': '71',
      'NameCollection': 'Trang điểm mắt',
      'ImagePath': 'https://i.imgur.com/M4K0qSF.png'
    },
    {
      'IDCollection': '72',
      'NameCollection': 'Trang điểm môi',
      'ImagePath': 'https://i.imgur.com/T6Own6Y.png'
    },
    {
      'IDCollection': '73',
      'NameCollection': 'Trang điểm mặt',
      'ImagePath': 'https://i.imgur.com/GgeJHS7.png'
    },
    {
      'IDCollection': '74',
      'NameCollection': 'Dưỡng da mặt',
      'ImagePath': 'https://i.imgur.com/f2VLcqE.png'
    },
    {
      'IDCollection': '75',
      'NameCollection': 'Làm sạch',
      'ImagePath': 'https://i.imgur.com/4krT6wF.png'
    },
    {
      'IDCollection': '76',
      'NameCollection': 'Mặt nạ',
      'ImagePath': 'https://i.imgur.com/vehvOLq.png'
    },
    {
      'IDCollection': '77',
      'NameCollection': 'Chăm sóc body',
      'ImagePath': 'https://i.imgur.com/bKV0Mhl.png'
    },
    {
      'IDCollection': '78',
      'NameCollection': 'Trang điểm',
      'ImagePath': 'https://i.imgur.com/T6Own6Y.png'
    },
    {
      'IDCollection': '79',
      'NameCollection': 'Dưỡng da',
      'ImagePath': 'https://i.imgur.com/xBnlR7n.png'
    },
    {
      'IDCollection': '80',
      'NameCollection': 'Chăm sóc cơ thể',
      'ImagePath': 'https://i.imgur.com/bKV0Mhl.png'
    }
  ];

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
              GridItem("Nhãn hàng", dataBrand),
              GridItem("Công dụng", dataCategory)
            ],
          ),
        )
      ],
    )));
  }
}
