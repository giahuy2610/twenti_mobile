import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:twenti_mobile/themes/theme.dart';
import 'package:twenti_mobile/views/product%20page/productPage.dart';

import '../../../services/currency_format/currencyFormat.dart';
import '../controllers/futureAddToCart.dart';

class ProductCartItem extends StatefulWidget {
  late final String? image;
  late final String name;
  late final int id;
  late final int price;
  late int quantity;
  late final isUseInCart;
  ProductCartItem(
      {this.image,
      required this.name,
      required this.id,
      required this.price,
      required this.quantity,
      this.isUseInCart = true});

  @override
  State<ProductCartItem> createState() => _ProductCartItemState();
}

class _ProductCartItemState extends State<ProductCartItem> {
  bool _isChecked = false;

  Widget quantityPicker() {
    return Container(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              futureAddToCart(context, widget.id, 0).then((value) {
                if (value == true) {
                  setState(() {
                    widget.quantity--;
                  });
                } else {}
              });
            },
            child: ColoredBox(
                color: Colors.grey.shade300, child: Icon(CupertinoIcons.minus)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              widget.quantity.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          InkWell(
            onTap: () async {
              futureAddToCart(context, widget.id, 1).then((value) {
                if (value == true) {
                  setState(() {
                    widget.quantity++;
                  });
                } else {}
              });
            },
            child: ColoredBox(
                color: Colors.grey.shade300, child: Icon(CupertinoIcons.plus)),
          )
        ],
      ),
    );
  }

  Widget item() {
    return Container(
      child: Row(
        children: [
          if (widget.isUseInCart == true)
            Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
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
            child: Container(
              child: Row(
                children: [
                  Image.network(widget.image!, height: 150),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(Theme.of(context)
                          .own()
                          .defaultVerticalPaddingOfScreen),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //product name
                          Text(
                            widget.name,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis),
                            maxLines: 2,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  currencyFormat(widget.price),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                (widget.isUseInCart == true)
                                    ? quantityPicker()
                                    : Text(
                                        "Số lượng: ${widget.quantity}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                              ])
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget slidable() {
    return Slidable(
      enabled: widget.isUseInCart,
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
            label: 'Xóa',
          ),
          SlidableAction(
            onPressed: (context) {
              print("hh");
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Chia sẻ',
          ),
        ],
      ),

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
