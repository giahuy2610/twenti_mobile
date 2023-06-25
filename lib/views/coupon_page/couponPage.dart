import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../models/coupon/Coupon.dart';
import '../../common widgets/top navigation/topNavigation.dart';
import 'controllers/futureGetCoupon.dart';
import 'widgets/coupon.dart';

class CouponPage extends StatefulWidget {
  const CouponPage({Key? key}) : super(key: key);

  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TopNavigation(
            left: Row(
              children: [
                Material(
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.keyboard_arrow_left)),
                ),
                Text(
                  "vouchers".tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            isSearcher: false),
        Expanded(
            child: FutureBuilder<List<CouponModel>>(
                future: futureGetCoupon(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10, right: 10),
                            child: coupon(snapshot.data![index]),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })),
      ],
    )));
  }
}
