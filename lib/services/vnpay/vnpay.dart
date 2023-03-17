import 'package:vnpay_flutter/vnpay_flutter.dart';

void vnpay() {
  final paymentUrl = VNPAYFlutter.instance.generatePaymentUrl(
    url:
        'https://sandbox.vnpayment.vn/paymentv2/vpcpay.html', //vnpay url, default is https://sandbox.vnpayment.vn/paymentv2/vpcpay.html
    version: '2.0.1', //version of VNPAY, default is 2.0.1
    tmnCode: 'UVY7QA94', //vnpay tmn code, get from vnpay
    txnRef: DateTime.now()
        .millisecondsSinceEpoch
        .toString(), //ref code, default is timestamp
    orderInfo: 'Pay 30.000 VND', //order info, default is Pay Order
    amount: 30000, //amount
    returnUrl:
        "http://localhost:8000/api/vnpay-return", //https://sandbox.vnpayment.vn/apis/docs/huong-dan-tich-hop/#code-returnurl
    ipAdress: '192.168.1.4', //Your IP address
    vnpayHashKey:
        'QWHUNEBSCZUSILCAYLDGCWVYWMZIKKKQ', //vnpay hash key, get from vnpay
    vnPayHashType: VNPayHashType
        .HMACSHA512, //hash type. Default is HmacSHA512, you can chang it in: https://sandbox.vnpayment.vn/merchantv2
  );
  VNPAYFlutter.instance.show(
      paymentUrl: paymentUrl,
      onPaymentSuccess: (params) {
        print("success");
      }, //on mobile transaction success
      onPaymentError: (params) {
        print("error");
      }, //on mobile transaction error
      onWebPaymentComplete: () {} //only use in web
      );
}
