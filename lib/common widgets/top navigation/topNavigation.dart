import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/search%20page/searchPage.dart';

class TopNavigation extends StatelessWidget {
  late final Widget? left;
  late final Widget? right;
  late final Widget? stepRight;
  late bool isSearcher;
  Widget placeHolder = const SizedBox(
    width: 50,
    height: 50,
  );

  TopNavigation(
      {super.key,
      this.left,
      this.right,
      this.stepRight,
      this.isSearcher = true});

  Widget searchFiedld(context) {
    return Container(
        width: 150,
        decoration: BoxDecoration(
            border: Border.all(
              // color: Theme.of(context).own().headingSearchBoxBorderColor,
              color: Colors.redAccent,
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
      decoration: BoxDecoration(
          color: Theme.of(context).own().defaultContainerColor,
          border: Border(
              bottom: BorderSide(
                  width: 1,
                  color: Theme.of(context).own().defaultScaffoldColor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                if (left is Text)
                  SizedBox(
                    width:
                        Theme.of(context).own().defaultVerticalPaddingOfScreen,
                  ),
                left != null ? left! : placeHolder,
                if (isSearcher == true)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Material(
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: SearchPage(),
                                      childCurrent: context.widget));
                            },
                            child: searchFiedld(context)),
                      ),
                    ),
                  )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 0),
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
