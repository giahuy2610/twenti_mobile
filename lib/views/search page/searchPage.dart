import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common widgets/top navigation/topNavigation.dart';
import '../cart page/cartPage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TopNavigation(
          isSearcher: false,
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
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => CartPage()));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined))),
          stepRight: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 100),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ),
        ),
        Expanded(child: Text(""))
      ],
    )));
  }
}
