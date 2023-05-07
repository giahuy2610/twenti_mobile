import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/address_checkout_page/controllers/futureGetDistrict.dart';
import 'package:twenti_mobile/views/address_checkout_page/controllers/futureGetWard.dart';

import '../controllers/futureGetProvince.dart';

class AddressCheckoutContainer extends StatefulWidget {
  const AddressCheckoutContainer({Key? key}) : super(key: key);

  @override
  State<AddressCheckoutContainer> createState() =>
      _AddressCheckoutContainerState();
}

class _AddressCheckoutContainerState extends State<AddressCheckoutContainer> {
  late String selectedIdProvince = '00';
  late String selectedIdDistrict = '000';
  late String selectedIdWard = '00000';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).own().defaultContainerColor,
      padding: EdgeInsets.all(
          Theme.of(context).own().defaultVerticalPaddingOfScreen),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Địa chỉ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Tỉnh/thành phố"),
              FutureBuilder<List<Map<String, String>>>(
                future: futureGetProvince(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedIdProvince,
                        items: snapshot.data!
                            .map((e) => DropdownMenuItem(
                                  value: e['id'].toString(),
                                  child: Text(e['name']!),
                                ))
                            .toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedIdProvince = value!;
                            selectedIdDistrict = '000';
                            selectedIdWard = '00000';
                          });
                        },
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Quận/huyện"),
              FutureBuilder<List<Map<String, String>>>(
                future: futureGetDistrict(selectedIdProvince),
                builder: (BuildContext context, snapshot) {
                  return DropdownButtonHideUnderline(
                      child: DropdownButton(
                    value: selectedIdDistrict,
                    items: (snapshot.hasData)
                        ? snapshot.data!
                            .map((e) => DropdownMenuItem(
                                  value: e['id'].toString(),
                                  child: Text(e['name']!),
                                ))
                            .toList()
                        : [
                            const DropdownMenuItem(
                              value: '000',
                              child: Text("Quận/huyện"),
                            )
                          ],
                    onChanged: (String? value) {
                      setState(() {
                        selectedIdDistrict = value!;
                        selectedIdProvince = '00';
                        selectedIdWard = '00000';
                      });
                    },
                  ));
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Phường/xã"),
              FutureBuilder<List<Map<String, String>>>(
                future: futureGetWard(selectedIdDistrict),
                builder: (BuildContext context, snapshot) {
                  return DropdownButtonHideUnderline(
                      child: DropdownButton(
                    value: selectedIdWard,
                    items: (snapshot.hasData)
                        ? snapshot.data!
                            .map((e) => DropdownMenuItem(
                                  child: Text(e['name']!),
                                  value: e['id'].toString(),
                                ))
                            .toList()
                        : [
                            const DropdownMenuItem(
                              value: '00000',
                              child: Text("Phường/xã"),
                            )
                          ],
                    onChanged: (String? value) {
                      setState(() {
                        selectedIdWard = value!;
                        selectedIdProvince = '00';
                        selectedIdDistrict = '000';
                      });
                    },
                  ));
                },
              ),
            ],
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(20, 3, 20, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                keyboardType: TextInputType.text,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.home_outlined),
                    color: Colors.grey,
                  ),
                  hintText: 'Số nhà, đường,...',
                ),
              )),
        ],
      ),
    );
  }
}
