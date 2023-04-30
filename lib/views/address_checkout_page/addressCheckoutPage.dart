import 'package:flutter/material.dart';

import '../../common widgets/top navigation/topNavigation.dart';

class AddressCheckoutPage extends StatefulWidget {
  const AddressCheckoutPage({Key? key}) : super(key: key);

  @override
  State<AddressCheckoutPage> createState() => _AddressCheckoutPageState();
}

class _AddressCheckoutPageState extends State<AddressCheckoutPage> {
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
            )
          ],
        )),
      ],
    )));
  }
}
