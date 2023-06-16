import 'package:badges/badges.dart' as badges;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:twenti_mobile/providers/cartProvider.dart';
import 'package:twenti_mobile/providers/collectionPageProvider.dart';
import 'package:twenti_mobile/providers/globalProvider.dart';
import 'package:twenti_mobile/services/firebase%20oauth/login.dart';
import 'package:twenti_mobile/services/notification/notificationController.dart';
import 'package:twenti_mobile/services/shared%20preferences/sharedPreferences.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/account_page/accountPage.dart';
import 'package:twenti_mobile/views/cart%20page/cartPage.dart';
import 'package:twenti_mobile/views/cart%20page/controllers/getCart.dart';
import 'package:twenti_mobile/views/category%20page/categoryPage.dart';
import 'package:twenti_mobile/views/home%20page/homePage.dart';
import 'package:twenti_mobile/views/map_page/mapPage.dart';
import 'package:twenti_mobile/views/notification_page/notificationPage.dart';
import 'package:twenti_mobile/views/search%20page/searchPage.dart';
import 'package:twenti_mobile/views/welcome_page/welcomePage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Authentication.initializeFirebase();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize cho Local Notification
  await NotificationController.initializeLocalNotifications(debug: true);

  // Initialize cho Push Notification
  await NotificationController.initializeRemoteNotifications(debug: true);

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => GlobalProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => CollectionPageProvider()),
    ], child: TwentiApp()),
  );
}

class TwentiApp extends StatefulWidget {
  const TwentiApp({Key? key}) : super(key: key);

  @override
  State<TwentiApp> createState() => _TwentiAppState();
}

class _TwentiAppState extends State<TwentiApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferencesObject().futureGetIdCus(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == 0)
            return WelcomePage();
          else
            return MyApp();
        } else {
          return Container(
            color: Colors.white,
          );
        }
      },
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with RouteAware {
  static final navigatorKey = GlobalKey<NavigatorState>();
  int _index = 0;
  List<Map<String, dynamic>> navList = [
    {
      'id': 0,
      "title": "Trang chủ",
      "iconPath": "assets/icons/icon_house.svg",
      "routePath": "",
      "isNoti": false,
      "futureToGetBadge": null
    },
    {
      'id': 1,
      "title": "Danh mục",
      "iconPath": "assets/icons/icon_lipstick.svg",
      "routePath": "",
      "isNoti": false,
      "futureToGetBadge": null
    },
    {
      'id': 2,
      "title": "Thông báo",
      "iconPath": "assets/icons/icon_bell.svg",
      "routePath": "",
      "isNoti": true,
      "futureToGetBadge": null
    },
    {
      'id': 3,
      "title": "Cửa hàng",
      "iconPath": "assets/icons/icon_map.svg",
      "routePath": "",
      "isNoti": false,
      "futureToGetBadge": null
    },
    {
      'id': 4,
      "title": "Tài khoản",
      "iconPath": "assets/icons/User.svg",
      "routePath": "",
      "isNoti": true,
      "futureToGetBadge": null
    }
  ];
  final QuickActions quickActions = const QuickActions();

  void _setupQuickActions() {
    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'action_find_store',
          localizedTitle: 'Cửa hàng gần nhất',
          icon: 'icons8_map_marker'),
      const ShortcutItem(
          type: 'action_cart', localizedTitle: 'Giỏ hàng', icon: 'icons8_cart'),
      const ShortcutItem(
          type: 'action_search',
          localizedTitle: 'Tìm sản phẩm',
          icon: 'icons8_search')
    ]);
  }

  void _handleQuickActions() {
    quickActions.initialize((shortcutType) {
      if (shortcutType == 'action_search') {
        navigatorKey.currentState
            ?.push(MaterialPageRoute(builder: (context) => const SearchPage()));
      } else if (shortcutType == 'action_cart') {
        navigatorKey.currentState
            ?.push(MaterialPageRoute(builder: (context) => CartPage()));
      } else if (shortcutType == 'action_find_store') {
        navigatorKey.currentState
            ?.push(MaterialPageRoute(builder: (context) => MapSample()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    NotificationController()
        .requestFirebaseToken()
        .then((value) => context.read<CartProvider>().deviceTokenFCM = value);
    _setupQuickActions();
    _handleQuickActions();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getCart(context);
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Twenti',
      theme: lightTheme,
      // darkTheme: darkTheme,
      home: Scaffold(
          body: IndexedStack(
            index: _index,
            children: [
              const HomePage(),
              CategoryPage(),
              const NotificationPage(),
              const MapSample(),
              const AccountPage()
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).own().defaultContainerColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).own().defaultScaffoldColor,
                      spreadRadius: 1)
                ]),
            padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal:
                    Theme.of(context).own().defaultVerticalPaddingOfScreen),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var i in navList)
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _index = i['id'];
                          });
                        },
                        child: Container(
                          child: (i['id'] == _index)
                              ? Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: const Color.fromRGBO(
                                          244, 163, 155, 0.4)),
                                  child: Row(
                                    children: [
                                      badges.Badge(
                                        position: badges.BadgePosition.custom(
                                            top: -6, end: -6),
                                        showBadge: i["isNoti"],
                                        badgeContent: i["isNoti"]
                                            ? i["futureToGetBadge"]
                                            : const Text(""),
                                        child: SvgPicture.asset(
                                          i["iconPath"]!,
                                          color: Colors.red,
                                          width: 24,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        i['title'],
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )
                              : badges.Badge(
                                  position: badges.BadgePosition.custom(
                                      top: -6, end: -6),
                                  showBadge: i["isNoti"],
                                  badgeContent: i["isNoti"]
                                      ? i["futureToGetBadge"]
                                      : const Text(""),
                                  child: SvgPicture.asset(
                                    i["iconPath"]!,
                                    width: 24,
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
              ],
            ),
          )),

      debugShowCheckedModeBanner: false,
    );
  }
}
