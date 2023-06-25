import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class description extends StatefulWidget {
  final String rawHtml;
  description(this.rawHtml);

  @override
  State<description> createState() => _descriptionState(rawHtml);
}

class _descriptionState extends State<description> {
  final String rawHtml;
  bool isShow = false;
  double? webViewHeight;
  late WebViewController? _webViewController;

  @override
  void dispose() {
    _webViewController = null;
    super.dispose();
  }

  _descriptionState(this.rawHtml);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: isShow == true ? null : 300,
                child: SizedBox(
                  height: webViewHeight ?? 300,
                  child: WebView(
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (controller) {
                        this._webViewController = controller;
                        controller.loadHtmlString(
                            '''<!DOCTYPE html><html><head><meta name="viewport" content="width=device-width, initial-scale=1.0"></head><!--rest of your html-->''' +
                                rawHtml);
                      },
                      onPageFinished: (some) async {
                        final _webViewController = this._webViewController;
                        if (_webViewController != null) {
                          webViewHeight = double.tryParse(
                            await _webViewController
                                .runJavascriptReturningResult(
                                    "document.documentElement.scrollHeight;"),
                          )!;
                          setState(() {});
                        }
                      }),
                ),
              ),
              isShow == false
                  ? InkWell(
                      onTap: () => setState(() {
                            isShow = !isShow;
                          }),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: [Colors.white.withOpacity(0.7), Colors.white],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                        child: Text(
                          "readAll".tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ))
                  : Container(),
            ],
          ),
          isShow == true
              ? InkWell(
                  onTap: () => setState(() {
                        isShow = !isShow;
                      }),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Text(
                      "minimize".tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
              : Container()
        ],
      ),
    );
  }
}
