import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/coupon_page/couponPage.dart';

import '../../../services/chat/chat.dart';
import '../../view_recents_page/viewRecentsPage.dart';

class AccountMenu extends StatelessWidget {
  late List<dynamic> menuItem = [
    {
      "name": "Đã xem gần đây",
      "nameEn": "Recently viewed",
      "icon": "assets/icons/viewed.svg",
      "route": ViewRecentsPage(),
      "function": null
    },
    {
      "name": "Đã thích",
      "nameEn": "Favorite",
      "icon": "assets/icons/heart.svg",
      "route": ViewRecentsPage(),
      "function": null
    },
    {
      "name": "Mã giảm giá",
      "nameEn": "Voucher",
      "icon": "assets/icons/voucher.svg",
      "route": CouponPage(),
      "function": null
    },
    {
      "name": "Khách thân thiết",
      "nameEn": "Memberships",
      "icon": "assets/icons/medal.svg",
      "route": ViewRecentsPage(),
      "function": null
    },
    {
      "name": "Nạp tiền",
      "nameEn": "Top up",
      "icon": "assets/icons/Dollar.svg",
      "route": ViewRecentsPage(),
      "function": null
    },
    {
      "name": "Twenti live",
      "nameEn": "Twenti live",
      "icon": "assets/icons/live.svg",
      "route": ViewRecentsPage(),
      "function": null
    },
    {
      "name": "Nhắn tin",
      "nameEn": "Chat with Twenti",
      "icon": "assets/icons/chat.svg",
      "route": null,
      "function": newChat
    },
    {
      "name": "Trợ giúp",
      "nameEn": "Help",
      "icon": "assets/icons/faq.svg",
      "route": ViewRecentsPage(),
      "function": null
    }
  ];

  static const Color btnColor = Color(0xFFF6E6DF);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).own().defaultContainerColor,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(
          Theme.of(context).own().defaultVerticalPaddingOfScreen),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: Theme.of(context).own().defaultMarginBetween,
        children: [
          for (var i in menuItem)
            InkWell(
              onTap: i['function'] == null
                  ? () => Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: i['route'] as Widget,
                          childCurrent: this))
                  : i['function']!,
              child: Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width -
                        Theme.of(context).own().defaultVerticalPaddingOfScreen *
                            5) /
                    4,
                height: (MediaQuery.of(context).size.width -
                        Theme.of(context).own().defaultVerticalPaddingOfScreen *
                            5) /
                    4,
                decoration: BoxDecoration(
                    color: btnColor, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(i['icon']!.toString()),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      context.locale.languageCode == 'vn'
                          ? i['name']!.toString()
                          : i['nameEn']!.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
