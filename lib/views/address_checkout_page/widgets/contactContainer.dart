import 'package:flutter/material.dart';
import 'package:twenti_mobile/themes/theme.dart';

class ContactContainer extends StatefulWidget {
  final Function callBackNameContact;
  final Function callBackPhoneContact;
  ContactContainer(this.callBackNameContact, this.callBackPhoneContact);

  @override
  State<ContactContainer> createState() => _ContactContainerState();
}

class _ContactContainerState extends State<ContactContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).own().defaultContainerColor,
      padding: EdgeInsets.all(
          Theme.of(context).own().defaultVerticalPaddingOfScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Liên hệ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Theme.of(context).own().defaultMarginBetween,
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(20, 3, 20, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                onChanged: (value) {
                  widget.callBackNameContact(value);
                },
                keyboardType: TextInputType.text,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.account_circle_outlined),
                    color: Colors.grey,
                  ),
                  hintText: 'Tên người nhận',
                ),
              )),
          SizedBox(
            height: Theme.of(context).own().defaultMarginBetween,
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(20, 3, 20, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                maxLength: 10,
                onChanged: (value) {
                  widget.callBackPhoneContact(value);
                },
                keyboardType: TextInputType.phone,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.phone_android_outlined),
                    color: Colors.grey,
                  ),
                  hintText: 'Số điện thoại',
                ),
              )),
        ],
      ),
    );
  }
}
