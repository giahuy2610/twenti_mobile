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

//   String htmlData = """<div>
//   <h1>Demo Page</h1>
//   <p>This is a fantastic product that you should buy!</p>
//   <h3>Features</h3>
//   <ul>
//     <li>It actually works</li>
//     <li>It exists</li>
//     <li>It doesn't cost much!</li>
//   </ul>
//   <!--You can pretty much put any html in here!-->
// </div>""";
//   dom.Document document = ;
//   /// sanitize or query document here
//   Widget html =
// }
