import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/views/collection%20page/collectionPage.dart';
import 'package:twenti_mobile/views/collection%20page/controllers/futureGetCollection.dart';

class SwitchCardsEvent extends StatefulWidget {
  const SwitchCardsEvent({Key? key}) : super(key: key);

  @override
  State<SwitchCardsEvent> createState() => _SwitchCardsEventState();
}

class _SwitchCardsEventState extends State<SwitchCardsEvent> {
  List<dynamic> listImage = [
    {
      'path': '65',
      'img':
          'https://image.hsv-tech.io/575x0/tfs/common/26d9c8c4-a082-4de7-98ff-38bca0492b9c.webp'
    },
    {
      'path': '65',
      'img':
          'https://image.hsv-tech.io/575x0/tfs/common/aa08a229-aa77-4686-a5de-88b1d91a9bd0.webp'
    },
    {
      'path': '65',
      'img':
          'https://image.hsv-tech.io/575x0/tfs/common/0dd3908c-4dc6-4f5c-abe2-b7e225be95e9.webp'
    },
    {
      'path': '65',
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
                key: ObjectKey(i),
                padding: EdgeInsets.only(
                    left: 10 * (listImage.indexOf(i).toDouble()),
                    top: 10 * (listImage.indexOf(i).toDouble())),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            child: CollectionPage(
                                futureGetCollection(int.parse(i['path']))),
                            childCurrent: widget));
                  },
                  child: Draggable(
                    onDragEnd: (listener) {
                      if (MediaQuery.of(context).size.width / 3 >
                              listener.offset.dx ||
                          MediaQuery.of(context).size.width * 2 / 3 <
                              listener.offset.dx) {
                        setState(() {
                          listImage.insert(0, i);
                          listImage.removeLast();
                        });
                      }
                    },
                    feedback: Image.network(
                      i['img']!,
                      scale: 2,
                    ),
                    childWhenDragging: Container(
                      width: 20,
                      height: 20,
                    ),
                    child: Image.network(
                      i['img']!,
                      scale: 2,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
