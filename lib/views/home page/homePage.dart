import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common widgets/bottom navigation/bottomNavigation.dart';
import '../../common widgets/top navigation/topNavigation.dart';
import '../cart page/cartPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            right: Material(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CartPage()));
                    },
                    icon: const Icon(Icons.shopping_bag_outlined))),
            stepRight: Material(
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.filter_list_alt)),
            )),
        Expanded(child: SvgPicture.asset('assets/icons/Send.svg')),
        BottomNavigation()
      ],
    )));
  }
}
