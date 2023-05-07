import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/address_checkout_page/widgets/addressContainer.dart';

import '../../common widgets/top navigation/topNavigation.dart';
import 'controllers/futureGetProvince.dart';

class AddressCheckoutPage extends StatefulWidget {
  const AddressCheckoutPage({Key? key}) : super(key: key);

  @override
  State<AddressCheckoutPage> createState() => _AddressCheckoutPageState();
}

class _AddressCheckoutPageState extends State<AddressCheckoutPage> {
  Widget contactContainer() {
    return Container(
      padding: EdgeInsets.all(
          Theme.of(context).own().defaultVerticalPaddingOfScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Liên hệ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Tên người nhận'),
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Số điện thoại'),
            keyboardType: TextInputType.phone,
          )
        ],
      ),
    );
  }

  Widget addressContainer() {
    return Container(
      padding: EdgeInsets.all(
          Theme.of(context).own().defaultVerticalPaddingOfScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Địa chỉ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text("Tỉnh/thành phố"),
              DropdownButton(
                value: "New York",
                items: [
                  DropdownMenuItem(child: Text("New York"), value: "New York"),
                ],
                onChanged: (value) {},
              ),
            ],
          ),
          Row(
            children: [
              Text("Tỉnh/thành phố"),
              DropdownButton(
                value: "New York",
                items: [
                  //add items in the dropdown
                  DropdownMenuItem(child: Text("New York"), value: "New York"),

                  DropdownMenuItem(
                    child: Text("Tokyo"),
                    value: "Tokyo",
                  ),

                  DropdownMenuItem(
                    child: Text("Moscow"),
                    value: "Moscow",
                  )
                ],
                onChanged: (value) {
                  //get value when changed
                  print("You selected $value");
                },
              ),
            ],
          ),
          Row(
            children: [
              Text("Tỉnh/thành phố"),
              DropdownButton(
                value: "New York",
                items: [
                  //add items in the dropdown
                  DropdownMenuItem(child: Text("New York"), value: "New York"),

                  DropdownMenuItem(
                    child: Text("Tokyo"),
                    value: "Tokyo",
                  ),

                  DropdownMenuItem(
                    child: Text("Moscow"),
                    value: "Moscow",
                  )
                ],
                onChanged: (value) {
                  //get value when changed
                  print("You selected $value");
                },
              ),
            ],
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Tên đường, số nhà...'),
            keyboardType: TextInputType.phone,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    futureGetProvince()
        .then((value) => print(value.map((e) => e['id'].toString()).toList()));
    return Scaffold(
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
            contactContainer(),
            AddressCheckoutContainer(),
          ],
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Hủy bỏ",
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Hoàn thành",
              ),
            ),
          ],
        ),
      ],
    )));
  }
}
