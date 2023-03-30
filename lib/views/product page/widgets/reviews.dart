import 'package:flutter/material.dart';
import 'package:twenti_mobile/views/product%20page/widgets/reviewItem.dart';
import 'package:twenti_mobile/views/review%20page/reviewPage.dart';

import '../../../common widgets/rating stars/ratingStars.dart';
import '../../../models/product/review.dart';

class reviews extends StatelessWidget {
  final List<Review> reviewList;
  reviews(this.reviewList);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(color: Colors.white),
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => reviewPage(reviewList))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Đánh giá (${reviewList.length})"),
                ratingStars(1)
              ],
            ),
            for (var i in reviewList.getRange(0, 2)) reviewItem(i),
            Text("Xem tất cả >")
          ],
        ),
      ),
    );
  }
}
