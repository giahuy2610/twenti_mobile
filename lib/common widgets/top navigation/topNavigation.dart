import 'package:animated_text_kit/animated_text_kit.dart';
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

  TopNavigation(
      {super.key,
      this.left,
      this.right,
      this.stepRight,
      this.isSearcher = true});

  Widget placeHolder = const SizedBox(
    width: 50,
    height: 50,
  );

  final listOfHintSearcher = [
    "Mặt nạ dưỡng ẩm",
    "Siêu sale tháng 5",
    "Mỹ phẩm dưới 200k"
  ];

  int currentHintIndex = 0;

  Widget searchFiedld(context) {
    return Container(
        clipBehavior: Clip.hardEdge,
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
          children: [
            Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            AnimatedTextKit(
              animatedTexts: [
                for (var i in this.listOfHintSearcher)
                  TypewriterAnimatedText(i,
                      speed: Duration(milliseconds: 200),
                      textStyle: TextStyle(color: Colors.grey)),
              ],
              isRepeatingAnimation: true,
              repeatForever: true,
              pause: Duration(milliseconds: 5000),
            ),
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
