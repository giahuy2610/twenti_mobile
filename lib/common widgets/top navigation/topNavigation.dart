import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/search%20page/searchPage.dart';

class TopNavigation extends StatelessWidget {
  late final Widget? left;
  late final Widget? right;
  late final Widget? stepRight;
  late bool? isSearcher = true;
  Widget placeHolder = const SizedBox(
    width: 50,
    height: 50,
  );

  TopNavigation(
      {super.key, this.left, this.right, this.stepRight, this.isSearcher});

  Widget searchFiedld(context) {
    return Container(
        decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).own().textBaloon, width: 2),
            borderRadius: BorderRadius.circular(500)),
        padding: const EdgeInsets.all(5),
        child: Row(
          children: const [
            Icon(CupertinoIcons.search),
            Text("Place holder...")
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 2, color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                left != null ? left! : placeHolder,
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SearchPage()));
                      },
                      child: searchFiedld(context)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: stepRight != null ? stepRight! : placeHolder,
                ),
                right != null ? right! : placeHolder
              ],
            ),
          )
        ],
      ),
    );
  }
}
