import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../services/shared preferences/sharedPreferences.dart';
import '../../collection page/collectionPage.dart';
import '../../qr_scanner_page/qrScannerPage.dart';
import '../controllers/futureProductsSearching.dart';

class topNavigationSearchPage extends StatefulWidget {
  @override
  State<topNavigationSearchPage> createState() =>
      _topNavigationSearchPageState();
}

class _topNavigationSearchPageState extends State<topNavigationSearchPage> {
  final TextEditingController _controllerTextField = TextEditingController();
  bool _canClear = false;
  final FocusNode _focusNode = FocusNode();

  // void itemCallToSearchField(String newValue) {
  //   _controllerTextField.text = newValue;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 2, color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.keyboard_arrow_left)),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.pinkAccent, width: 2)),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      focusNode: _focusNode,
                      controller: _controllerTextField,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isCollapsed: true,
                        focusColor: Colors.transparent,
                        hintText: 'Eiu mua gì nà',
                      ),
                      onChanged: (v) {
                        //request to get autocomplete searching value
                        //check to can click to clear or not
                        bool canClearTemp;
                        if (v.length > 0)
                          canClearTemp = true;
                        else
                          canClearTemp = false;
                        if (_canClear != canClearTemp)
                          setState(() {
                            _canClear = canClearTemp;
                          });
                      },
                      onSubmitted: (v) async {
                        //saving the searching value
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child:
                                    CollectionPage(futureProductsSearching(v)),
                                childCurrent: context.widget));

                        //achieve the result of
                        await SharedPreferencesObject().saveSearchingHistory(v);
                      },
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: _canClear
                            ? InkWell(
                                onTap: () {
                                  _controllerTextField.clear();
                                  setState(() {
                                    _canClear = false;
                                  });
                                },
                                child: const Icon(Icons.close),
                              )
                            : InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const qrScannerPage()));
                                },
                                child:
                                    const Icon(Icons.qr_code_scanner_outlined),
                              ),
                      ),
                      InkWell(
                        onTap: () async {
                          //saving the searching value
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: CollectionPage(futureProductsSearching(
                                      _controllerTextField.text)),
                                  childCurrent: context.widget));

                          //achieve the result of
                          await SharedPreferencesObject()
                              .saveSearchingHistory(_controllerTextField.text);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Text(
                            "Tìm kiếm",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
