import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twenti_mobile/themes/theme.dart';

class AboutProductContainer extends StatefulWidget {
  @override
  State<AboutProductContainer> createState() => _AboutProductContainerState();
}

class _AboutProductContainerState extends State<AboutProductContainer> {
  late int selectedStar = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: Theme.of(context).own().defaultProductCardMargin * 2),
      padding: EdgeInsets.all(
          Theme.of(context).own().defaultVerticalPaddingOfScreen),
      decoration: BoxDecoration(
        color: Theme.of(context).own().defaultContainerColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Đánh giá tổng quát"),
              Row(
                children: [
                  for (var i in List.generate(5, (index) => index + 1))
                    InkWell(
                        onTap: () {
                          setState(() {
                            print(i);
                            selectedStar = i;
                          });
                        },
                        child: i > selectedStar
                            ? SvgPicture.asset(
                                'assets/icons/startDefault.svg',
                                width: 30,
                              )
                            : SvgPicture.asset('assets/icons/starFill.svg',
                                width: 30)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
