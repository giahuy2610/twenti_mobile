import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/collection%20page/controllers/futureGetCollection.dart';

import '../../collection page/collectionPage.dart';

class productHeading extends StatelessWidget {
  late String nameProduct;
  late String categoryName;
  late String nameBrand;
  late int idBrand;
  late int brandCollection;

  productHeading(
      {required this.nameProduct,
      required this.nameBrand,
      required this.categoryName,
      required this.idBrand,
      required this.brandCollection});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          Theme.of(context).own().defaultVerticalPaddingOfScreen),
      decoration:
          BoxDecoration(color: Theme.of(context).own().defaultContainerColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Theme.of(context).own().defaultMarginBetween),
          Text(
            nameProduct,
            softWrap: true,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: Theme.of(context).own().defaultMarginBetween),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      child:
                          CollectionPage(futureGetCollection(brandCollection)),
                      childCurrent: context.widget));
            },
            child: Text(
              nameBrand,
              textAlign: TextAlign.end,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
