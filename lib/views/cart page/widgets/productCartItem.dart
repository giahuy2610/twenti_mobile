import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCartItem extends StatelessWidget {
  late final String? image;
  late final String name;
  late final int id;
  late final int price;
  ProductCartItem(
      {this.image, required this.name, required this.id, required this.price});

  Widget quantityPicker() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          border: Border.all(width: 2.0, color: Colors.black12)),
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Icon(CupertinoIcons.minus),
          ),
          Text("1"),
          InkWell(
            onTap: () {},
            child: Icon(CupertinoIcons.plus),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 70,
      child: Row(
        children: [
          Image(
            image: NetworkImage(image!),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //product name
                Text(
                  name,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(price.toString()), quantityPicker()])
              ],
            ),
          )
        ],
      ),
    );
  }
}
