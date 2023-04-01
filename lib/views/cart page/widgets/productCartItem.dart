import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twenti_mobile/views/product%20page/productPage.dart';

class ProductCartItem extends StatefulWidget {
  late final String? image;
  late final String name;
  late final int id;
  late final int price;
  ProductCartItem(
      {this.image, required this.name, required this.id, required this.price});

  @override
  State<ProductCartItem> createState() => _ProductCartItemState();
}

class _ProductCartItemState extends State<ProductCartItem> {
  bool _isChecked = false;

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
          Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            checkColor: Colors.white,
            // fillColor: MaterialStateProperty.resolveWith(getColor),
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value!;
              });
            },
          ),
          Expanded(
              child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ProductPage(widget.id)));
            },
            child: Row(
              children: [
                Image(
                  image: NetworkImage(widget.image!),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //product name
                      Text(
                        widget.name,
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.price.toString()),
                            quantityPicker()
                          ])
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
