import 'package:flutter/material.dart';
import 'package:twenti_mobile/common%20widgets/rating%20stars/ratingStars.dart';

import '../../../models/product/review.dart';

class reviewItem extends StatelessWidget {
  final Review review;
  reviewItem(this.review);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Customer"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ratingStars(review.rating),
              Text(review.createdOn),
            ],
          ),
          Text(review.contentLong),
          Row(
            children: [
              for (var i in review.images!)
                Image.network(
                  i.path,
                  width: 150,
                  height: 150,
                )
            ],
          )
        ],
      ),
    );
  }
}
