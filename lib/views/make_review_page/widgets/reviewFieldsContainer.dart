import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twenti_mobile/themes/theme.dart';

class ReviewFieldsContainer extends StatefulWidget {
  @override
  State<ReviewFieldsContainer> createState() => _ReviewFieldsContainerState();
}

class _ReviewFieldsContainerState extends State<ReviewFieldsContainer> {
  late List<XFile?> images = <XFile>[];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Theme.of(context).own().defaultContainerColor),
      padding: EdgeInsets.all(
          Theme.of(context).own().defaultVerticalPaddingOfScreen),
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(20, 3, 20, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: const TextField(
                keyboardType: TextInputType.multiline,
                minLines: 5, //Normal textInputField will be displayed
                maxLines: 5, // when user presses enter it will adapt to it
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Đánh giá sản phẩm',
                ),
              )),
          SizedBox(height: Theme.of(context).own().defaultMarginBetween),
          Row(
            children: [
              for (var i in [1, 2, 3])
                (i > images.length)
                    ? Expanded(
                        child: InkWell(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();

// Pick an image.
                          images.add(await picker.pickImage(
                              source: ImageSource.gallery));
                        },
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            margin: EdgeInsets.all(Theme.of(context)
                                .own()
                                .defaultProductCardMargin),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                color: Theme.of(context)
                                    .own()
                                    .defaultContainerColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset("assets/icons/icon_camera.png"),
                                Text(
                                  "Tải lên hình ảnh",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                    : Expanded(
                        child: (AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            margin: EdgeInsets.all(Theme.of(context)
                                .own()
                                .defaultProductCardMargin),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                color: Theme.of(context)
                                    .own()
                                    .defaultContainerColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text("euyve"),
                          ),
                        )),
                      ),
            ],
          )
        ],
      ),
    );
  }
}
