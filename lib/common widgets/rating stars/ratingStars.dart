import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ratingStars extends StatelessWidget {
  final dynamic count;
  ratingStars(this.count);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          for (int i = 0; i < count; i++)
            SvgPicture.asset(
              'assets/icons/starFill.svg',
              color: Colors.redAccent,
            ),
          for (int i = count; i < 5; i++)
            SvgPicture.asset('assets/icons/startDefault.svg'),
        ],
      ),
    );
  }
}
