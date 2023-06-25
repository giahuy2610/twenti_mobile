import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:twenti_mobile/common%20widgets/rating%20stars/ratingStars.dart';
import 'package:twenti_mobile/themes/theme.dart';

import '../../../models/product/review.dart';

class reviewItem extends StatelessWidget {
  final Review review;
  reviewItem(this.review);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
          Theme.of(context).own().defaultVerticalPaddingOfScreen),
      margin: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: Theme.of(context).own().defaultProductCardMargin / 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("customer".tr()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ratingStars(review.rating),
              Text(DateFormat.yMd()
                  .add_jm()
                  .format(DateTime.tryParse(review.createdOn)!))
            ],
          ),
          SizedBox(height: Theme.of(context).own().defaultMarginBetween),
          Text(review.contentLong),
          Row(
            children: [
              for (var i in review.images!)
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(right: 5),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black45.withOpacity(0.1),
                          blurRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Image.network(
                      i.path,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              for (var i in review.images!)
                Container(
                  margin: EdgeInsets.only(right: 5),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.1),
                        blurRadius: 1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(children: [
                    Image.network(
                      i.path,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      color: Colors.black45,
                      child: Align(child: Text("+1")),
                    )
                  ]),
                ),
            ],
          )
        ],
      ),
    );
  }
}
