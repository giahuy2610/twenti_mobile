import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/search%20page/widgets/searchingItem.dart';
import 'package:twenti_mobile/views/search%20page/widgets/topNavigationSearchPage.dart';

import '../../services/shared preferences/sharedPreferences.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _temp = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).own().defaultContainerColor,
        body: SafeArea(
            child: Column(
          children: [
            topNavigationSearchPage(),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  FutureBuilder(
                      future:
                          SharedPreferencesObject().futureGetSearchingHistory(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<String>?> snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Lịch sử tìm kiếm"),
                                    InkWell(
                                      onTap: () {
                                        SharedPreferencesObject()
                                            .clearSearchingHistory();
                                        setState(() {
                                          _temp++;
                                        });
                                      },
                                      child: Row(
                                        children: const [
                                          Text("Xóa tất cả"),
                                          Icon(Icons.close_rounded),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Wrap(
                                  spacing: 5,
                                  runSpacing: 5,
                                  children: [
                                    for (var i in snapshot.data!)
                                      searchingItem(i)
                                  ],
                                ),
                              ]));
                        } else {
                          return Container();
                        }
                      }),
                  SizedBox(
                    height: Theme.of(context).own().defaultMarginBetween,
                  ),
                  FutureBuilder(
                      future:
                          SharedPreferencesObject().futureGetSearchingHistory(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<String>?> snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Xu hướng tìm kiếm"),
                                    InkWell(
                                      onTap: () {},
                                      child: Row(
                                        children: const [
                                          Text("Xóa tất cả"),
                                          Icon(Icons.close_rounded),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Wrap(
                                  spacing: 5,
                                  runSpacing: 5,
                                  children: [
                                    for (var i in [
                                      'Kem dưỡng',
                                      'Mặt nạ',
                                      'Dưỡng ẩm'
                                    ])
                                      searchingItem(i)
                                  ],
                                ),
                              ]));
                        } else {
                          return Container();
                        }
                      }),
                ],
              ),
            ))
          ],
        )));
  }
}
