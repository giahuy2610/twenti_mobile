import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class AccountMenu extends StatelessWidget {
  const AccountMenu({Key? key}) : super(key: key);
  static const Color btnColor = Color(0xFFEBBFAF);
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
            children:[
              //Hàng 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const SizedBox( width: 5),
                  //Nút 1
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15, bottom: 5),
                    child: SizedBox(
                      width: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: btnColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(
                                'assets/icons/viewed.svg',
                                semanticsLabel: 'heart',
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Đã xem gần đây',
                            textAlign : TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Nút 2
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15, bottom: 5),
                    child: SizedBox(
                      width: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: btnColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(
                                'assets/icons/heart.svg',
                                semanticsLabel: 'heart',
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Đã thích',
                            textAlign : TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Nút 3
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15, bottom: 5),
                    child: SizedBox(
                      width: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: btnColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(
                                'assets/icons/voucher.svg',
                                semanticsLabel: 'heart',
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Kho Voucher',
                            textAlign : TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Nút 4
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15, bottom: 5),
                    child: SizedBox(
                      width: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: btnColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(
                                'assets/icons/medal.svg',
                                semanticsLabel: 'heart',
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Khách hàng thân thiết',
                            textAlign : TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]
        ),
        Row(
            children:[
              //Hàng 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const SizedBox( width: 5),
                  //Nút 1
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15, bottom: 5),
                    child: SizedBox(
                      width: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: btnColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(
                                'assets/icons/Dollar.svg',
                                semanticsLabel: 'heart',
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Nạp tiền',
                            textAlign : TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Nút 2
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15, bottom: 5),
                    child: SizedBox(
                      width: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: btnColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(
                                'assets/icons/live.svg',
                                semanticsLabel: 'heart',
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Twenti Live',
                            textAlign : TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Nút 3
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15, bottom: 5),
                    child: SizedBox(
                      width: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: btnColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(
                                'assets/icons/chat.svg',
                                semanticsLabel: 'heart',
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Nhắn tin cho Twenti',
                            textAlign : TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Nút 4
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15, bottom: 5),
                    child: SizedBox(
                      width: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: btnColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(
                                'assets/icons/faq.svg',
                                semanticsLabel: 'heart',
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Trợ giúp',
                            textAlign : TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]
        ),
      ],
    );
  }
}
