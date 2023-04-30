import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
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
        width: 150,
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(244, 163, 155, 1),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(500)),
        padding: const EdgeInsets.all(5),
        child: Row(
          children: const [
            Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            Text(
              "Mua gì em ",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
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
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: SearchPage(),
                                childCurrent: context.widget));
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
