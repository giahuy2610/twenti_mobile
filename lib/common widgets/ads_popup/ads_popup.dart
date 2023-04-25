import 'package:flutter/material.dart';

class adsPopup extends StatelessWidget {
  const adsPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Icon(Icons.close_rounded),
        Container(
          child: Image.asset("name"),
        )
      ],
    ));
  }
}
