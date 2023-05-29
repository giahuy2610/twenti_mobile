import 'package:flutter/material.dart';

class SwitchCardsEvent extends StatefulWidget {
  const SwitchCardsEvent({Key? key}) : super(key: key);

  @override
  State<SwitchCardsEvent> createState() => _SwitchCardsEventState();
}

class _SwitchCardsEventState extends State<SwitchCardsEvent> {
  final listImage = [
    {
      'path': '',
      'img':
          'https://image.hsv-tech.io/575x0/tfs/common/26d9c8c4-a082-4de7-98ff-38bca0492b9c.webp'
    },
    {
      'path': '',
      'img':
          'https://image.hsv-tech.io/575x0/tfs/common/aa08a229-aa77-4686-a5de-88b1d91a9bd0.webp'
    },
    {
      'path': '',
      'img':
          'https://image.hsv-tech.io/575x0/tfs/common/0dd3908c-4dc6-4f5c-abe2-b7e225be95e9.webp'
    },
    {
      'path': '',
      'img':
          'https://image.hsv-tech.io/575x0/tfs/common/88b5d66c-faa9-4565-8172-6749e2b58f38.webp'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Stack(
          children: [
            for (var i in listImage)
              Padding(
                padding: EdgeInsets.only(
                    left: 10 * (listImage.indexOf(i).toDouble()),
                    top: 10 * (listImage.indexOf(i).toDouble())),
                child: Draggable(
                  feedback: Image.network(
                    i['img']!,
                    scale: 2,
                  ),
                  child: Image.network(
                    i['img']!,
                    scale: 2,
                  ),
                  childWhenDragging: Container(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
