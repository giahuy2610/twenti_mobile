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
  late String nameCustomer = '';
  late String? phoneCustomer;
  late String? addressDetail;
  late String? city;
  late String? district;
  late String? ward;
  bool isValid = false;

  void getCheckValid() {
    bool newIsValid = false;
    if (nameCustomer.isNotEmpty &&
        phoneCustomer!.isNotEmpty &&
        city!.isNotEmpty &&
        district!.isNotEmpty &&
        ward!.isNotEmpty &&
        addressDetail!.isNotEmpty)
      newIsValid = true;
    else
      newIsValid = false;
    if (newIsValid != isValid)
      setState(() {
        isValid = newIsValid;
      });
  }

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
                  (e) {
                    this.addressDetail = e;
                    this.getCheckValid();
                  },
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.redAccent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Hủy bỏ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  isValid == true
                      ? InkWell(
                          onTap: () {
                            context
                                .read<CartProvider>()
                                .saveCustomerAddressContact(
                                    this.nameCustomer!,
                                    this.phoneCustomer!,
                                    this.city!,
                                    this.district!,
                                    this.ward!,
                                    this.addressDetail!);
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Hoàn thành",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Hoàn thành",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ],
        )));
  }
}
