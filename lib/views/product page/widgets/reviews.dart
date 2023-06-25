import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/product%20page/widgets/reviewItem.dart';
import 'package:twenti_mobile/views/review%20page/reviewPage.dart';

import '../../../common widgets/rating stars/ratingStars.dart';
import '../../../models/product/review.dart';

class reviews extends StatelessWidget {
  final List<Review> reviewList;
  reviews(this.reviewList);

  @override
  Widget build(BuildContext context) {
    var avg = 0;
    for (var i in reviewList) avg += i.rating;
    if (avg != 0) avg = (avg / reviewList.length).toInt();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      padding: EdgeInsets.all(
          Theme.of(context).own().defaultVerticalPaddingOfScreen),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "reviews".tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text("(${reviewList.length})"),
                ],
              ),
              ratingStars(avg)
            ],
          ),
          SizedBox(height: Theme.of(context).own().defaultMarginBetween),
          for (var i in (reviewList.length > 2
              ? reviewList.getRange(0, 2)
              : reviewList))
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: Theme.of(context).own().defaultProductCardMargin),
              child: reviewItem(i),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(5)),
            ),
          if (reviewList.length > 2)
            Padding(
              padding: EdgeInsets.only(
                  top: Theme.of(context).own().defaultMarginBetween),
              child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: reviewPage(reviewList),
                          childCurrent: this)),
                  child: Text("${"all".tr()} >")),
            ),
          if (reviewList.isEmpty) Text("makeFirstReview".tr())
        ],
      ),
    );
  }
}
