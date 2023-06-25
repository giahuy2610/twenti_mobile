import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../welcome_page/welcomePage.dart';

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //Background with image from assets
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/icons/account_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      height: 150,
      child: Stack(alignment: Alignment.centerRight, children: [
        Container(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            (context.locale.languageCode == "vn")
                ? IconButton(
                    onPressed: () {
                      context.setLocale(const Locale("en", "US"));
                    },
                    icon: Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500)),
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/1280px-Flag_of_Vietnam.svg.png",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ))
                : IconButton(
                    onPressed: () {
                      context.setLocale(Locale("vn", "VN"));
                    },
                    icon: Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500)),
                      child: Image.network(
                        "https://cdn.britannica.com/33/4833-050-F6E415FE/Flag-United-States-of-America.jpg",
                        fit: BoxFit.cover,
                      ),
                    )),
            IconButton(
                style: IconButton.styleFrom(foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: WelcomePage(),
                          childCurrent: widget),
                      (route) => false);
                },
                icon: Icon(Icons.logout_rounded))
          ],
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
            //Custom circle avatar
            Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/icons/circle_avatar.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            //Customer account info
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hoàng tử bé',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: const BoxDecoration(
                      //màu bạc
                      color: Color(0xFFC0C0C0),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Text(
                        'Thành viên bạc',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  //Hiển thị đã thích và đang theo dõi
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Đã thích: 0',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Đang theo dõi: 0',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ],
        ),
      ]),
    );
  }
}
