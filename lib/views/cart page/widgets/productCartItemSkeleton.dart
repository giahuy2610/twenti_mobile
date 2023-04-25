import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class productCartItemSkeleton extends StatelessWidget {
  const productCartItemSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SkeletonItem(
        child: Row(
          children: [
            const SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  shape: BoxShape.rectangle, width: 50, height: 50),
            ),
            Expanded(
              child: SkeletonParagraph(
                style: SkeletonParagraphStyle(
                    lines: 3,
                    spacing: 6,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 10,
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
