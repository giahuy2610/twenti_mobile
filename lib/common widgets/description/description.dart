import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class description extends StatefulWidget {
  final String rawHtml;
  description(this.rawHtml);

  @override
  State<description> createState() => _descriptionState(rawHtml);
}

class _descriptionState extends State<description> {
  final String rawHtml;
  bool isShow = false;

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
                  child: Html(data: rawHtml)),
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
                        child: const Text(
                          "Xem đầy đủ",
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
                    child: const Text(
                      "Thu gọn",
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
