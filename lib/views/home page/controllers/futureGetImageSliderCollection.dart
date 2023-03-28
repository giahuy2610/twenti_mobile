import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:twenti_mobile/models/image_slider/image_slider.dart';

import '../../../services/http/constant.dart';

Future<List<ImageSlider>> futureGetImageSliderCollection() async {
  http.Response response =
      await http.get(Uri.parse('$baseUrl/api/image-slider/available'));
  print(response.body);
  if (response.statusCode == 200) {
    var list = json.decode(response.body);
    var res = <ImageSlider>[];
    for (var i in list) {
      res.add(ImageSlider.fromJson(i));
    }
    return res;
  } else {
    throw Exception('Failed to load post');
  }
}
