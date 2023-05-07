import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/address_checkout_page/controllers/achieveAddress.dart';
import 'package:twenti_mobile/views/address_checkout_page/widgets/addressContainer.dart';
import 'package:twenti_mobile/views/address_checkout_page/widgets/contactContainer.dart';

import '../../common widgets/top navigation/topNavigation.dart';
import 'controllers/futureGetProvince.dart';

class AddressCheckoutPage extends StatefulWidget {
  const AddressCheckoutPage({Key? key}) : super(key: key);

  @override
  State<AddressCheckoutPage> createState() => _AddressCheckoutPageState();
}

class _AddressCheckoutPageState extends State<AddressCheckoutPage> {
  @override
  Widget build(BuildContext context) {
    futureGetProvince()
        .then((value) => print(value.map((e) => e['id'].toString()).toList()));
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(
          children: [
            TopNavigation(
                left: Row(
                  children: [
                    Material(
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.keyboard_arrow_left))),
                    Text(
                      "Thêm địa chỉ",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                isSearcher: false),
            Expanded(
                child: ListView(
              children: [
                ContactContainer(),
                SizedBox(
                  height: Theme.of(context).own().defaultProductCardMargin,
                ),
                AddressCheckoutContainer(),
              ],
            )),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(
                        color: Colors.red,
                        style: BorderStyle.solid,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Hủy bỏ",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      achieveAddress();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Hoàn thành",
                    ),
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
