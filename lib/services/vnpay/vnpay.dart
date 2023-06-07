import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum VNPayHashType {
  SHA256,
  HMACSHA512,
}

class VNPAYFlutter {
  static final VNPAYFlutter _instance = VNPAYFlutter();
  static VNPAYFlutter get instance => _instance;
  Map<String, dynamic> _sortParams(Map<String, dynamic> params) {
    final sortedParams = <String, dynamic>{};
    final keys = params.keys.toList()..sort();
    for (String key in keys) {
      sortedParams[key] = params[key];
    }
    return sortedParams;
  }

  String generatePaymentUrl({
    String url = 'https://sandbox.vnpayment.vn/paymentv2/vpcpay.html',
    required String version,
    String command = 'pay',
    required String tmnCode,
    String locale = 'vn',
    String currencyCode = 'VND',
    required String txnRef,
    String orderInfo = 'Pay Order',
    required double amount,
    required String returnUrl,
    required String ipAdress,
    String? createAt,
    required String vnpayHashKey,
    VNPayHashType vnPayHashType = VNPayHashType.HMACSHA512,
  }) {
    final params = <String, dynamic>{
      'vnp_Version': version,
      'vnp_Command': command,
      'vnp_TmnCode': tmnCode,
      'vnp_Locale': locale,
      'vnp_CurrCode': currencyCode,
      'vnp_TxnRef': txnRef,
      'vnp_OrderInfo': orderInfo,
      'vnp_Amount': (amount * 100).toStringAsFixed(0),
      'vnp_ReturnUrl': returnUrl,
      'vnp_IpAddr': ipAdress,
      'vnp_CreateDate': createAt ??
          DateFormat('yyyyMMddHHmmss').format(DateTime.now()).toString(),
    };
    var sortedParam = _sortParams(params);
    final hashDataBuffer = StringBuffer();
    sortedParam.forEach((key, value) {
      hashDataBuffer.write(key);
      hashDataBuffer.write('=');
      hashDataBuffer.write(value);
      hashDataBuffer.write('&');
    });
    String hashData =
        hashDataBuffer.toString().substring(0, hashDataBuffer.length - 1);
    String query = Uri(queryParameters: sortedParam).query;
    String vnpSecureHash = "";

    if (vnPayHashType == VNPayHashType.SHA256) {
      List<int> bytes = utf8.encode(vnpayHashKey + hashData.toString());
      vnpSecureHash = sha256.convert(bytes).toString();
    } else {
      vnpSecureHash = Hmac(sha512, utf8.encode(vnpayHashKey))
          .convert(utf8.encode(hashData))
          .toString();
    }
    String paymentUrl =
        "$url?$query&vnp_SecureHashType=${vnPayHashType == VNPayHashType.HMACSHA512 ? "HmacSHA512" : "SHA256"}&vnp_SecureHash=$vnpSecureHash";
    return paymentUrl;
  }

  Future<WebView> show({
    required String paymentUrl,
    Function(Map<String, dynamic>)? onPaymentSuccess,
    Function(Map<String, dynamic>)? onPaymentError,
    Function()? onWebPaymentComplete,
  }) async {
    print(paymentUrl);
    // var controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setBackgroundColor(const Color(0x00000000))
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {
    //         // Update loading bar.
    //       },
    //       onPageStarted: (String url) {},
    //       onPageFinished: (String url) {},
    //       onWebResourceError: (WebResourceError error) {},
    //       onNavigationRequest: (NavigationRequest request) {
    //         if (request.url.startsWith('https://www.youtube.com/')) {
    //           return NavigationDecision.prevent;
    //         }
    //         return NavigationDecision.navigate;
    //       },
    //     ),
    //   )
    //   ..loadRequest(Uri.parse('https://flutter.dev'));

    // final FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
    // flutterWebviewPlugin.onUrlChanged.listen((url) async {
    //   if (url.contains('vnp_ResponseCode')) {
    //     final params = Uri.parse(url).queryParameters;
    //     if (params['vnp_ResponseCode'] == '00') {
    //       if (onPaymentSuccess != null) {
    //         onPaymentSuccess(params);
    //       }
    //     } else {
    //       if (onPaymentError != null) {
    //         onPaymentError(params);
    //       }
    //     }
    //     flutterWebviewPlugin.close();
    //   }
    // });
    // WebViewWidget(controller: controller);
    return WebView(
      onWebViewCreated: (controller) {},
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: paymentUrl,
    );
  }
}

// import 'package:vnpay_flutter/vnpay_flutter.dart';
//
String vnpay() {
  print("vnpay attacked");
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

  return paymentUrl;
}
