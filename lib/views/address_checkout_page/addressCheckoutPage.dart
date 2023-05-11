import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenti_mobile/providers/cartProvider.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/address_checkout_page/widgets/addressContainer.dart';
import 'package:twenti_mobile/views/address_checkout_page/widgets/contactContainer.dart';

import '../../common widgets/top navigation/topNavigation.dart';

class AddressCheckoutPage extends StatefulWidget {
  const AddressCheckoutPage({Key? key}) : super(key: key);

  @override
  State<AddressCheckoutPage> createState() => _AddressCheckoutPageState();
}

class _AddressCheckoutPageState extends State<AddressCheckoutPage> {
  late String? nameCustomer;
  late String? phoneCustomer;
  late String? addressDetail;
  late String? city;
  late String? district;
  late String? ward;

  @override
  Widget build(BuildContext context) {
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
                ContactContainer(
                  (e) => this.nameCustomer = e,
                  (e) => this.phoneCustomer = e,
                ),
                SizedBox(
                  height: Theme.of(context).own().defaultProductCardMargin,
                ),
                AddressCheckoutContainer(
                  (e) => this.city = e,
                  (e) => this.district = e,
                  (e) => this.ward = e,
                  (e) => this.addressDetail = e,
                ),
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
                      side: const BorderSide(
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
                      context.read<CartProvider>().saveCustomerAddressContact(
                          this.nameCustomer!,
                          this.phoneCustomer!,
                          this.city!,
                          this.district!,
                          this.ward!,
                          this.addressDetail!);
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
