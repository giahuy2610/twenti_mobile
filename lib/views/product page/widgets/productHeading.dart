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
      child: Column(
        children: [
          Row(
            children: [Text(nameBrand)],
          ),
          Row(children: [Text(nameProduct)])
        ],
      ),
    );
  }
}
