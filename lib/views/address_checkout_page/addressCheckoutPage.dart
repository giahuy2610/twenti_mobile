import 'package:flutter/material.dart';

import '../../common widgets/top navigation/topNavigation.dart';

class AddressCheckoutPage extends StatefulWidget {
  const AddressCheckoutPage({Key? key}) : super(key: key);

  @override
  State<AddressCheckoutPage> createState() => _AddressCheckoutPageState();
}

class _AddressCheckoutPageState extends State<AddressCheckoutPage> {
  Widget contactContainer() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Liên hệ"),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Địa chỉ"),
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
        )),
        Expanded(
            child: ListView(
          children: [
            contactContainer(),
            addressContainer(),
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
