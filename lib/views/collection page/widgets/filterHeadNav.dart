import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../models/product/product.dart';
import '../../../providers/collectionPageProvider.dart';

class FilterHeadContainer extends StatefulWidget {
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  bool? isAZSort;
  bool? isPriceIncreaseSort;

  @override
  State<FilterHeadContainer> createState() => _FilterHeadContainerState();
}

class _FilterHeadContainerState extends State<FilterHeadContainer> {
  late CollectionPageProvider provider;
  final List<String> _filtersBrandId = <String>[];
  final List<int> _filtersCategoryId = <int>[];

  void sortIncreaseByPrice(bool isTrue) {
    List<Product> listOfProduct = provider.listOfProducts;
    if (isTrue == true)
      listOfProduct.sort((a, b) => a.retailPrice.compareTo(b.retailPrice));
    else
      listOfProduct.sort((a, b) => b.retailPrice.compareTo(a.retailPrice));
    for (var i in listOfProduct) print(i.retailPrice);
    this.provider.saveListOfProducts(listOfProduct);
  }

  void sortIncreaseByName(bool isTrue) {
    List<Product> listOfProduct = provider.listOfProducts;
    if (isTrue == true)
      listOfProduct.sort((a, b) => a.nameProduct.compareTo(b.nameProduct));
    else
      listOfProduct.sort((a, b) => b.nameProduct.compareTo(a.nameProduct));
    for (var i in listOfProduct) print(i.nameProduct);
    this.provider.saveListOfProducts(listOfProduct);
  }

  void filterByBrandId() {
    List<Product> listOfProduct = provider.listOfProducts;
    listOfProduct.where((element) => _filtersBrandId.contains(element.idBrand));

    for (var i in listOfProduct) print(i.nameProduct);
    this.provider.saveListOfProducts(listOfProduct);
  }

  @override
  void initState() {
    super.initState();
    provider = context.read<CollectionPageProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      height: 5,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Sắp xếp",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Theo thứ tự"),
                          if (widget.isAZSort == null ||
                              widget.isAZSort == false)
                            IconButton(
                                onPressed: () {
                                  sortIncreaseByName(true);
                                  setState(() {
                                    widget.isAZSort = true;
                                  });
                                },
                                icon: SvgPicture.asset(
                                    "assets/icons/a_z_sort.svg"))
                          else
                            IconButton(
                                onPressed: () {
                                  sortIncreaseByName(false);
                                  setState(() {
                                    widget.isAZSort = false;
                                  });
                                },
                                icon: SvgPicture.asset(
                                    "assets/icons/z_a_sort.svg"))
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Theo giá"),
                            if (widget.isPriceIncreaseSort == null ||
                                widget.isPriceIncreaseSort == false)
                              IconButton(
                                  onPressed: () {
                                    sortIncreaseByPrice(true);
                                    setState(() {
                                      widget.isPriceIncreaseSort = true;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_downward))
                            else
                              IconButton(
                                  onPressed: () {
                                    sortIncreaseByPrice(false);
                                    setState(() {
                                      widget.isPriceIncreaseSort = false;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_upward))
                          ])
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Lọc",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text("Khoảng giá"),
                          ),
                          RangeSlider(
                            values: widget._currentRangeValues,
                            max: 100,
                            divisions: 5,
                            labels: RangeLabels(
                              widget._currentRangeValues.start
                                  .round()
                                  .toString(),
                              widget._currentRangeValues.end.round().toString(),
                            ),
                            onChanged: (RangeValues values) {
                              setState(() {
                                widget._currentRangeValues = values;
                              });
                            },
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text("Nhãn hàng"),
                          ),
                          Wrap(spacing: 5.0, children: [
                            for (var i in provider.listOfProducts
                                .map((e) => e.brand!.nameBrand)
                                .toSet())
                              FilterChip(
                                label: Text(i),
                                selected: _filtersBrandId.contains(i),
                                onSelected: (bool value) {
                                  setState(() {
                                    if (value) {
                                      if (!_filtersBrandId.contains(i)) {
                                        _filtersBrandId.add(i);
                                      }
                                    } else {
                                      _filtersBrandId
                                          .removeWhere((String brand) {
                                        return brand == i;
                                      });
                                    }
                                  });
                                  filterByBrandId();
                                },
                              )
                          ]),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text("Công dụng"),
                          ),
                          Wrap(spacing: 5.0, children: [
                            // for (var i in provider.listOfProducts)
                            //   FilterChip(
                            //     label: Text(i.),
                            //     selected:
                            //         _filtersCategoryId.contains(exercise.name),
                            //     onSelected: (bool value) {
                            //       setState(() {
                            //         if (value) {
                            //           if (!_filtersCategoryId
                            //               .contains(exercise.name)) {
                            //             _filtersCategoryId.add(exercise.name);
                            //           }
                            //         } else {
                            //           _filtersCategoryId.removeWhere((int id) {
                            //             return id == exercise.name;
                            //           });
                            //         }
                            //       });
                            //     },
                            //   )
                          ]),
                        ],
                      )
                    ],
                  )
                ])));
  }
}

Future filterHeadNav(context) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterHeadContainer());
}
