import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<Map<String, String>>> futureGetDistrict(String idProvince) async {
  final String response =
      await rootBundle.loadString('assets/address/districts/$idProvince.json');
  final data = await json.decode(response);
  List<Map<String, String>> list = <Map<String, String>>[];
  list.add({"id": "000", "name": "Quận/huyện"});
  data.forEach((final String key, final value) {
    list.add({"id": key, "name": value['name']});
  });
  return list;
}
