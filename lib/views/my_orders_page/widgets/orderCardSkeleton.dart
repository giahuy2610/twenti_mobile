import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class OrderCardSkeleton extends StatelessWidget {
  const OrderCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 4,
        margin: const EdgeInsets.all(5),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black45.withOpacity(0.1),
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: SkeletonItem(
          child: Column(
            children: [
              const Expanded(
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      width: double.infinity, height: double.infinity),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SkeletonParagraph(
                              style: SkeletonParagraphStyle(
                                  lines: 2,
                                  spacing: 10,
                                  lineStyle: SkeletonLineStyle(
                                    randomLength: true,
                                    height: 10,
                                    borderRadius: BorderRadius.circular(8),
                                    minLength:
                                        MediaQuery.of(context).size.width / 8,
                                  )))
                        ])),
              )
            ],
          ),
        ));
  }
}
