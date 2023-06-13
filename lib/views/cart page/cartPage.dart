import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/views/cart%20page/widgets/bottomNavigation.dart';
import 'package:twenti_mobile/views/cart%20page/widgets/productCartListView.dart';

import '../../common widgets/top navigation/topNavigation.dart';
import '../../services/shared preferences/sharedPreferences.dart';
import '../login page/loginPage.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TopNavigation(
            left: Material(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.keyboard_arrow_left)),
            ),
            right: Material(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  "assets/icons/icon_trash.png",
                ),
              ),
            )),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: SharedPreferencesObject().futureGetIdCus(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data == 0) {
                        return Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                OutlinedButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType
                                                .rightToLeftWithFade,
                                            child: LoginPage(),
                                            childCurrent: this)),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: BorderSide(
                                                    color: Colors.red)))),
                                    child: Text("Đăng nhập")),
                                SizedBox(
                                  width: 15,
                                ),
                                OutlinedButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType
                                                .rightToLeftWithFade,
                                            child: LoginPage(),
                                            childCurrent: this)),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: BorderSide(
                                                    color: Colors.red)))),
                                    child: Text("Đăng kí"))
                              ],
                            ));
                      } else
                        return ProductCartListView();
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
              BottomNavigation(),
            ],
          ),
        )
      ],
    )));
  }
}
