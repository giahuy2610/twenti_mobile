import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<Map<String, String>>> futureGetWard(String idDistrict) async {
  final String response =
      await rootBundle.loadString('assets/address/wards/$idDistrict.json');
  final data = await json.decode(response);
  List<Map<String, String>> list = <Map<String, String>>[];
  list.add({"id": "00000", "name": "Phường/xã"});
  data.forEach((final String key, final value) {
    list.add({"id": key, "name": value['name']});
  });
  return list;
}
