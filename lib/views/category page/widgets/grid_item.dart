import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/themes/theme.dart';

import '../../collection page/collectionPage.dart';
import '../../collection page/controllers/futureGetCollection.dart';

class GridItem extends StatelessWidget {
  String nameList = "";
  late final itemsData;
  GridItem(this.nameList, this.itemsData);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          Theme.of(context).own().defaultVerticalPaddingOfScreen),
      decoration:
          BoxDecoration(color: Theme.of(context).own().defaultScaffoldColor),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nameList,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(onPressed: () {}, child: Text("Xem tất cả"))
            ],
          ),
          for (var i in itemsData)
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(
                        Theme.of(context).own().defaultProductCardMargin),
                    child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: CollectionPage(futureGetCollection(
                                    int.parse(i['IDCollection']))),
                                childCurrent: context.widget)),
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color:
                                              Colors.black45.withOpacity(0.1),
                                          blurRadius: 1,
                                          spreadRadius: 1),
                                    ],
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.network(
                                    i["ImagePath"],
                                    scale: 1,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(
                                height: Theme.of(context)
                                    .own()
                                    .defaultMarginBetween),
                            Text(
                              i['NameCollection'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(
                        Theme.of(context).own().defaultProductCardMargin),
                    child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: CollectionPage(futureGetCollection(
                                    int.parse(i['IDCollection']))),
                                childCurrent: context.widget)),
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color:
                                              Colors.black45.withOpacity(0.1),
                                          blurRadius: 1,
                                          spreadRadius: 1),
                                    ],
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.network(
                                    i["ImagePath"],
                                    scale: 1,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(
                                height: Theme.of(context)
                                    .own()
                                    .defaultMarginBetween),
                            Text(
                              i['NameCollection'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(
                        Theme.of(context).own().defaultProductCardMargin),
                    child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: CollectionPage(futureGetCollection(
                                    int.parse(i['IDCollection']))),
                                childCurrent: context.widget)),
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color:
                                              Colors.black45.withOpacity(0.1),
                                          blurRadius: 1,
                                          spreadRadius: 1),
                                    ],
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.network(
                                    i["ImagePath"],
                                    scale: 1,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(
                                height: Theme.of(context)
                                    .own()
                                    .defaultMarginBetween),
                            Text(
                              i['NameCollection'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}