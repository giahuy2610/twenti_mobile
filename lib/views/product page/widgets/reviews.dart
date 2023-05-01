import 'package:flutter/material.dart';
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
                    "Đánh giá ",
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
            reviewItem(i),
          (reviewList.length > 2)
              ? InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => reviewPage(reviewList))),
                  child: Text("Xem tất cả >"))
              : Text(
                  "Nhanh tay mua hàng để trở thành người đầu tiên đánh giá sản phẩm")
        ],
      ),
    );
  }
}
