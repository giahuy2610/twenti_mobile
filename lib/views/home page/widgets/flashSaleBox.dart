import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';

import '../../../common widgets/product card/productCard.dart';
import '../../../common widgets/product card/productCardSkeleton.dart';
import '../../../models/product/collection.dart';
import '../../collection page/controllers/futureGetCollection.dart';

class flashSaleHeader extends StatefulWidget {
  late int seconds;

  flashSaleHeader(this.seconds);

  @override
  State<flashSaleHeader> createState() => _flashSaleHeaderState();
}

class _flashSaleHeaderState extends State<flashSaleHeader> {
  Timer? timer;
  int _days = 0;
  int _hours = 0;
  int _mins = 0;
  int _secs = 0;

  void calcCountDown() {
    _days = widget.seconds ~/ 86400;
    _hours = (widget.seconds - _days * 86400) ~/ 3600;
    _mins = (widget.seconds - _days * 86400 - _hours * 3600) ~/ 60;
    _secs = (widget.seconds - _days * 86400 - _hours * 3600 - _mins * 60);
    widget.seconds--;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        calcCountDown();
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  String convertToTwoDigits(int number) {
    if (number < 10) {
      return '0$number';
    } else {
      return number.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Image.network(
              "https://image.hsv-tech.io/800x0/tfs/common/f5c3203e-ccaa-4394-8a0e-d148ee18cfc0.webp",
              width: 150,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: RichText(
                      text: TextSpan(
                        text: convertToTwoDigits(_days),
                        style: DefaultTextStyle.of(context).style.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'days'.tr(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(color: Colors.grey.shade300))),
                    child: RichText(
                      text: TextSpan(
                        text: convertToTwoDigits(_hours),
                        style: DefaultTextStyle.of(context).style.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'hours'.tr(),
                              style: TextStyle(fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.symmetric(
                      vertical: BorderSide(color: Colors.grey.shade300),
                    )),
                    child: RichText(
                      text: TextSpan(
                        text: convertToTwoDigits(_mins),
                        style: DefaultTextStyle.of(context).style.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'mins'.tr(),
                              style: TextStyle(fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: RichText(
                      text: TextSpan(
                        text: convertToTwoDigits(_secs),
                        style: DefaultTextStyle.of(context).style.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'secs'.tr(),
                              style: TextStyle(fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class flashSaleBox extends StatelessWidget {
  late int seconds;
  flashSaleBox(this.seconds);
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(top: Theme.of(context).own().defaultMarginBetween),
        padding: EdgeInsets.all(
            Theme.of(context).own().defaultVerticalPaddingOfScreen),
        decoration: BoxDecoration(
            color: Theme.of(context).own().headingSearchBoxBorderColor,
            borderRadius: BorderRadius.circular(0)),
        child: Column(
          children: [
            flashSaleHeader(seconds),
            Stack(alignment: Alignment.centerRight, children: [
              FutureBuilder<Collection>(
                  future: futureGetCollection(65),
                  builder: (builder, snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          for (var i in snapshot.data!.products)
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: productCard(i))
                        ]),
                      );
                    } else {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var i = 0; i < 3; i++)
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: productCardSkeleton())
                          ],
                        ),
                      );
                    }
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        _controller.animateTo(
                            _controller.offset -
                                MediaQuery.of(context).size.width,
                            duration: Duration(seconds: 1),
                            curve: Curves.linear);
                      },
                      icon: Icon(Icons.chevron_left)),
                  IconButton(
                      onPressed: () {
                        _controller.animateTo(
                            _controller.offset +
                                MediaQuery.of(context).size.width,
                            duration: Duration(seconds: 1),
                            curve: Curves.linear);
                      },
                      icon: Icon(Icons.chevron_right)),
                ],
              )
            ]),
          ],
        ));
  }
}
