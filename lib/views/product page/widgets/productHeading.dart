import 'package:flutter/material.dart';

class productHeading extends StatelessWidget {
  late String nameProduct;
  late String categoryName;
  late String nameBrand;
  late int idBrand;

  productHeading(
      {required this.nameProduct,
      required this.nameBrand,
      required this.categoryName,
      required this.idBrand});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [Text(nameBrand)],
          ),
          Row(children: [
            Expanded(
              child: Text(
                nameProduct,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ])
        ],
      ),
    );
  }
}
