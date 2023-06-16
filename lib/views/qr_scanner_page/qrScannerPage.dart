import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../product page/productPage.dart';

class qrScannerPage extends StatefulWidget {
  const qrScannerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _qrScannerPageState();
}

class _qrScannerPageState extends State<qrScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: (result != null)
                    ? Text('Mã: ${result!.code!}')
                    : Text('Đang tìm mã...'),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100, left: 10),
          child: ClipOval(
            child: Material(
              color: Colors.blue, // Button color
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const SizedBox(
                    width: 48,
                    height: 48,
                    child: Icon(Icons.keyboard_arrow_left)),
              ),
            ),
          ),
        )
      ]),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        String code = result!.code!;
        //scan to get product information
        if (code.substring(0, 2) == 'SP') {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  child: ProductPage(int.parse(code.substring(2))),
                  childCurrent: widget));
        }
        //scan to get order information
        else if (code.substring(0, 2) == 'OR') {
        }
        //scan to get collection(sale,by brand,..ect) information
        else if (code.substring(0, 2) == 'CL') {}
      });
    }).onDone(() {
      Timer(Duration(seconds: 3), () {
        print("Delay 3s to avoid rewrite");
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
