import 'package:flutter/material.dart';

import '../product card/productCardSkeleton.dart';

class productListViewSkeleton extends StatelessWidget {
  const productListViewSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [for (var i = 0; i < 3; i++) productCardSkeleton()],
          ),
        ),
        Expanded(
          child: Column(
            children: [for (var i = 0; i < 3; i++) productCardSkeleton()],
          ),
        )
      ],
    );
  }
}
