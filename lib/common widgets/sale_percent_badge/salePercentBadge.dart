import 'package:flutter/material.dart';

class salePercentBadge extends StatelessWidget {
  final int percent;
  salePercentBadge(this.percent);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 174, 183, 1),
            borderRadius: BorderRadius.circular(5)),
        alignment: Alignment.center,
        child: Text(
          '-$percent%',
          style: TextStyle(color: Colors.white),
        ));
  }
}
