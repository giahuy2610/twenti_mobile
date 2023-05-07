import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../../services/http/constant.dart';

Future<bool> futureCancelOrder(int idInvoice) async {
  http.Response response = await http.put(
      Uri.parse('$baseUrl/api/invoice/tracking-status'),
      body: {"IDInvoice": idInvoice.toString(), "IDTracking": "6"});
  if (response.statusCode == 200) {
    Fluttertoast.showToast(
        msg: "Đã hủy đơn thành công",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
    return true;
  } else {
    return false;
  }
}
