import 'package:flutter/material.dart';

class HistoryPurchasedListView extends StatelessWidget {
  const HistoryPurchasedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 15, bottom: 5),
              child: Text(
                'Mua lại',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 5, top: 15, bottom: 5),
                child: Row(
                  children: const [
                    Text(
                      'Xem thêm',
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
