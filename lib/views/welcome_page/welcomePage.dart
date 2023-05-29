import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/main.dart';
import 'package:twenti_mobile/views/login%20page/loginPage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List<String> listImages = [
    'https://img.theculturetrip.com/wp-content/uploads/2018/01/shutterstock_372453505.jpg',
    'https://thumbs.dreamstime.com/b/cosmetic-beauty-products-pastel-color-background-light-coral-blue-space-flatlay-172868764.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (BuildContext context) => Scaffold(
            backgroundColor: const Color.fromRGBO(42, 36, 36, 1),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100))),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var i in listImages)
                          Padding(
                            padding: EdgeInsets.only(
                                right: listImages.indexOf(i) ==
                                        listImages.length - 1
                                    ? 0
                                    : 10),
                            child: Image.network(
                              i,
                              width: MediaQuery.of(context).size.width * 0.85,
                              fit: BoxFit.cover,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TweenAnimationBuilder<Offset>(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              tween: Tween<Offset>(
                                  begin: Offset(
                                      MediaQuery.of(context).size.width, 0),
                                  end: const Offset(0, 0)),
                              child: const Text(
                                "Khám phá các thương hiệu dành cho bạn",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              builder: (context, offset, child) {
                                return Transform.translate(
                                    offset: offset, child: child);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TweenAnimationBuilder<Offset>(
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeInOut,
                              tween: Tween<Offset>(
                                  begin: Offset(
                                      MediaQuery.of(context).size.width, 0),
                                  end: const Offset(0, 0)),
                              child: const Text(
                                "Khám phá sản phẩm dễ dàng qua các thương hiệu",
                                style: TextStyle(color: Colors.grey),
                              ),
                              builder: (context, offset, child) {
                                return Transform.translate(
                                    offset: offset, child: child);
                              },
                            ),
                          ],
                        ),
                        TweenAnimationBuilder<Offset>(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          tween: Tween<Offset>(
                              begin: const Offset(-150, 0),
                              end: const Offset(0, 0)),
                          child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: const LoginPage(),
                                      childCurrent: widget)),
                              child: const Text(
                                "Đăng ký tài khoản miễn phí",
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              )),
                          builder: (context, offset, child) {
                            return Transform.translate(
                                offset: offset, child: child);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: TweenAnimationBuilder<Offset>(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      tween: Tween<Offset>(
                          begin: const Offset(0, 150), end: const Offset(0, 0)),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: const LoginPage(),
                                childCurrent: widget)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: LoginPage(),
                                      childCurrent: widget)),
                              child: const Text(
                                "Đăng nhập",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: MyApp(),
                                      childCurrent: widget)),
                              child: const Text(
                                "Bỏ qua",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      builder: (context, offset, child) {
                        return Transform.translate(
                            offset: offset, child: child);
                      },
                    ))
              ],
            ),
          ),
        ));
  }
}
