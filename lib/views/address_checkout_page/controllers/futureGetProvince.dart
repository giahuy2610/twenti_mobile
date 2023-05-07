import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<Map<String, String>>> futureGetProvince() async {
  final String response =
      await rootBundle.loadString('assets/address/provinces.json');
  final data = await json.decode(response);
  List<Map<String, String>> list = <Map<String, String>>[];
  list.add({"id": "00", "name": "Tỉnh/thành phố"});
  data.forEach((final String key, final value) {
    list.add({"id": key, "name": value['name']});
  });
  return list;
}
