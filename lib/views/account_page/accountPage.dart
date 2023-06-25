import 'package:flutter/material.dart';
import 'package:twenti_mobile/views/account_page/widgets/accountMenu.dart';
import 'package:twenti_mobile/views/account_page/widgets/avatar.dart';
import 'package:twenti_mobile/views/account_page/widgets/orderMenu.dart';

//the reason why this page is stateless is because
//when navigating to this page, this page will be reloaded
//(Check home page Navigation Bar widget for more details)
//so it's not necessary to use stateful widget
class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        Expanded(
          child: Column(
            children: [
              Avatar(),
              OrderMenu(),
              // HistoryPurchasedListView(),
            ],
          ),
        ),
        AccountMenu(),
      ]),
    ));
  }
}
