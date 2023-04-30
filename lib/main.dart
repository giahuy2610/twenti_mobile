import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:twenti_mobile/providers/cartProvider.dart';
import 'package:twenti_mobile/providers/collectionPageProvider.dart';
import 'package:twenti_mobile/services/firebase%20oauth/login.dart';
import 'package:twenti_mobile/services/notification/notificationController.dart';
import 'package:twenti_mobile/views/cart%20page/cartPage.dart';
import 'package:twenti_mobile/views/cart%20page/controllers/getCart.dart';
import 'package:twenti_mobile/views/category%20page/categoryPage.dart';
import 'package:twenti_mobile/views/chat%20page/chatPage.dart';
import 'package:twenti_mobile/views/home%20page/homePage.dart';
import 'package:twenti_mobile/views/login%20page/loginPage.dart';
import 'package:twenti_mobile/views/search%20page/searchPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Authentication.initializeFirebase();

  // Initialize cho Local Notification
  await NotificationController.initializeLocalNotifications(debug: true);

  // Initialize cho Push Notification
  await NotificationController.initializeRemoteNotifications(debug: true);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => CollectionPageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final navigatorKey = GlobalKey<NavigatorState>();
  int _index = 0;
  List<Map<String, dynamic>> navList = [
    {
      "title": "Trang chủ",
      "iconPath": "assets/icons/Send.svg",
      "routePath": "",
      "isNoti": false,
      "futureToGetBadge": null
    },
    {
      "title": "Danh mục",
      "iconPath": "assets/icons/Send.svg",
      "routePath": "",
      "isNoti": false,
      "futureToGetBadge": null
    },
    {
      "title": "Tin nhắn",
      "iconPath": "assets/icons/Send.svg",
      "routePath": "",
      "isNoti": true,
      "futureToGetBadge": null
    },
    {
      "title": "Giỏ hàng",
      "iconPath": "assets/icons/Send.svg",
      "routePath": "",
      "isNoti": true,
      "futureToGetBadge": null
    },
    {
      "title": "Tài khoản",
      "iconPath": "assets/icons/User.svg",
      "routePath": "",
      "isNoti": false,
      "futureToGetBadge": null
    }
  ];
  final QuickActions quickActions = QuickActions();

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
        print('Show the help dialog!');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    NotificationController().requestFirebaseToken();
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
      theme: ThemeData(),
      home: Scaffold(
        body: IndexedStack(
          index: _index,
          children: [
            HomePage(),
            CategoryPage(),
            ChatPage(),
            CartPage(),
            LoginPage()
          ],
        ),
        bottomNavigationBar: Material(
            child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            for (var i in navList)
              BottomNavigationBarItem(
                icon: badges.Badge(
                  position: badges.BadgePosition.custom(top: -6, end: -6),
                  showBadge: i["isNoti"],
                  badgeContent:
                      i["isNoti"] ? i["futureToGetBadge"] : const Text(""),
                  child: SvgPicture.asset(
                    i["iconPath"]!,
                  ),
                ),
                label: i["title"]!,
                backgroundColor: Colors.blueGrey,
              ),
          ],
          currentIndex: _index,
          selectedItemColor: Colors.orange[400],
          unselectedFontSize: 14,
          selectedFontSize: 14,
          onTap: (i) => setState(() {
            _index = i;
          }),
          showUnselectedLabels: true,
        )),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
