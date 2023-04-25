import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../services/shared preferences/sharedPreferences.dart';
import '../../collection page/collectionPage.dart';
import '../controllers/futureProductsSearching.dart';

class searchingItem extends StatelessWidget {
  final String value;
  searchingItem(this.value);
  // final void callBack;
  // searchingItem(this.value, this.callBack);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        //saving the searching value
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                child: CollectionPage(futureProductsSearching(value)),
                childCurrent: context.widget));

        //achieve the result of
        await SharedPreferencesObject().saveSearchingHistory(value);
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(value),
              const SizedBox(
                width: 5,
              ),
              InkWell(onTap: () {}, child: const Icon(Icons.close_rounded))
            ],
          )),
    );
  }
}
