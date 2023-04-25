import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:twenti_mobile/providers/cartProvider.dart';
import 'package:twenti_mobile/views/product%20page/productPage.dart';

import '../controllers/futureAddToCart.dart';

class ProductCartItem extends StatefulWidget {
  late final String? image;
  late final String name;
  late final int id;
  late final int price;
  late int quantity;
  ProductCartItem(
      {this.image,
      required this.name,
      required this.id,
      required this.price,
      required this.quantity});

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
            onTap: () {
              futureAddToCart(context, widget.id, 0);
            },
            child: Icon(CupertinoIcons.minus),
          ),
          Text(widget.quantity.toString()),
          InkWell(
            onTap: () async {
              context.read<CartProvider>().saveCartProducts(
                  await futureAddToCart(context, widget.id, 1));
            },
            child: Icon(CupertinoIcons.plus),
          )
        ],
      ),
    );
  }

  Widget item() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                            Text(
                              widget.price.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
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

  Widget slidable() {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
              print("hh");
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {
              print("hh");
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (context) {
              print("hh");
            },
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: (context) {
              print("hh");
            },
            backgroundColor: Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Save',
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: item(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      height: 90,
      child: slidable(),
    );
  }
}
