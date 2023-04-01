import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:twenti_mobile/providers/cartProvider.dart';
import 'package:twenti_mobile/services/firebase%20oauth/login.dart';
import 'package:twenti_mobile/views/account%20page/accountPage.dart';
import 'package:twenti_mobile/views/cart%20page/cartPage.dart';
import 'package:twenti_mobile/views/category%20page/categoryPage.dart';
import 'package:twenti_mobile/views/chat%20page/chatPage.dart';
import 'package:twenti_mobile/views/home%20page/homePage.dart';
import 'package:twenti_mobile/views/login page/loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Authentication.initializeFirebase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
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
  int _index = 0;

  List<Map<String, String>> navList = [
    {
      "title": "Trang chủ",
      "iconPath": "assets/icons/Send.svg",
      "routePath": ""
    },
    {"title": "Danh mục", "iconPath": "assets/icons/Send.svg", "routePath": ""},
    {"title": "Tin nhắn", "iconPath": "assets/icons/Send.svg", "routePath": ""},
    {"title": "Giỏ hàng", "iconPath": "assets/icons/Send.svg", "routePath": ""},
    {"title": "Tài khoản", "iconPath": "assets/icons/Send.svg", "routePath": ""}
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twenti',
      theme: ThemeData(),
      home: SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: _index,
            children: [
              //LoginPage(),
              HomePage(),
              CategoryPage(),
              ChatPage(),
              CartPage(),
              AccountPage()
            ],
          ),
          bottomNavigationBar: Material(
              child: BottomNavigationBar(
            items: [
              for (var i in navList)
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    i["iconPath"]!,
                  ),
                  label: i["title"]!,
                  backgroundColor: Colors.blue,
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
       ),
      // debugShowCheckedModeBanner: false,
    );
  }
}
