import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';

import '../controllers/futureGetDistrict.dart';
import '../controllers/futureGetProvince.dart';
import '../controllers/futureGetWard.dart';

class AddressCheckoutContainer extends StatefulWidget {
  late Function callbackAddress;
  late Function callbackCity;
  late Function callbackDistrict;
  late Function callbackWard;

  AddressCheckoutContainer(this.callbackCity, this.callbackDistrict,
      this.callbackWard, this.callbackAddress);

  @override
  State<AddressCheckoutContainer> createState() =>
      _AddressCheckoutContainerState();
}

class _AddressCheckoutContainerState extends State<AddressCheckoutContainer> {
  late String selectedIdProvince = '01';
  late String selectedIdDistrict = '001';
  late String selectedIdWard = '00001';

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
              Expanded(child: Text("Tỉnh/thành phố")),
              Expanded(
                child: FutureBuilder<List<Map<String, String>>>(
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
                            widget.callbackCity(value);
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
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text("Quận/huyện")),
              Expanded(
                  child: FutureBuilder<List<Map<String, String>>>(
                future: futureGetDistrict(selectedIdProvince),
                builder: (BuildContext context, snapshot) {
                  return DropdownButtonHideUnderline(
                      child: DropdownButton(
                    value: selectedIdDistrict,
                    items: (snapshot.hasData)
                        ? (snapshot.data!
                            .map((e) => DropdownMenuItem(
                                  value: e['id'].toString(),
                                  child: Text(e['name']!),
                                ))
                            .toList())
                        : [
                            const DropdownMenuItem(
                              value: '000',
                              child: Text("Quận/huyện"),
                            )
                          ],
                    onChanged: (String? value) {
                      widget.callbackDistrict(value);
                      setState(() {
                        selectedIdDistrict = value!;
                        selectedIdWard = '00000';
                      });
                    },
                  ));
                },
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text("Phường/xã")),
              Expanded(
                  child: FutureBuilder<List<Map<String, String>>>(
                future: futureGetWard(selectedIdDistrict),
                builder: (BuildContext context, snapshot) {
                  return DropdownButtonHideUnderline(
                      child: DropdownButton(
                    isExpanded: true,
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
                      widget.callbackWard(value);
                      setState(() {
                        selectedIdWard = value!;
                      });
                    },
                  ));
                },
              )),
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
                onChanged: (value) {
                  widget.callbackAddress(value);
                },
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
