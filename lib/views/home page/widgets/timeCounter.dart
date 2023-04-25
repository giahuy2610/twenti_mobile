import 'dart:async';

import 'package:flutter/material.dart';

class timeCounter extends StatefulWidget {
  const timeCounter({Key? key}) : super(key: key);

  @override
  State<timeCounter> createState() => _timeCounterState();
}

class _timeCounterState extends State<timeCounter> {
  int _days = 0;
  int _hours = 0;
  int _mins = 0;
  int _secs = 0;
  int _totalSecs = 111255586;

  void calcCountDown() {
    print(1);
    setState(() {
      _days = _totalSecs ~/ 86400;
      _hours = (_totalSecs - _days * 86400) ~/ 3600;
      _mins = (_totalSecs - _days * 86400 - _hours * 3600) ~/ 60;
      _secs = (_totalSecs - _days * 86400 - _hours * 3600 - _mins * 60);
      _totalSecs -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) => calcCountDown());
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
          )),
          child: Text("$_days ngày"),
        ),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
          )),
          child: Text("$_hours giờ"),
        ),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
          )),
          child: Text("$_mins phút"),
        ),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
          )),
          child: Text("$_secs giây"),
        ),
      ],
    );
  }
}
