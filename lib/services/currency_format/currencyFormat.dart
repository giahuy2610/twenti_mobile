import 'package:intl/intl.dart';

String currencyFormat(int num, {String? symbol = "₫"}) =>
    NumberFormat("#,###").format(num).toString() + symbol!;
