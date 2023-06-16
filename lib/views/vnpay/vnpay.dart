import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:twenti_mobile/views/order_detail_page/controllers/futureGetOrderDetail.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../services/http/constant.dart';
import '../../services/vnpay/vnpay.dart';
import '../order_detail_page/orderDetailPage.dart';

class Vnpay extends StatefulWidget {
  late final IdInvoice;
  late final double TotalValue;
  Vnpay(this.IdInvoice, this.TotalValue);

  @override
  State<Vnpay> createState() => _VnpayState();
}

class _VnpayState extends State<Vnpay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: vnpay(widget.TotalValue),
              navigationDelegate: (nav) async {
                String url = nav.url;
                if (url.contains('vnp_ResponseCode')) {
                  final params = Uri.parse(url).queryParameters;
                  //send response to server
                  http.Response response = await http.post(
                    Uri.parse('$baseUrl/api/vnpay-return'),
                    headers: {'Content-Type': 'application/json'},
                    body: jsonEncode({
                      "vnp_ResponseCode": params['vnp_ResponseCode'],
                      "vnp_TxnRef": widget.IdInvoice.toString()
                    }),
                  );

                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: OrderDetailPage(
                              await futureGetOrderDetail(widget.IdInvoice)),
                          childCurrent: widget));
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              }),
        ),
      ),
    );
  }
}
