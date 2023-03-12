import 'package:flutter/cupertino.dart';
import 'package:twenti_mobile/common%20widgets/bottom%20navigation/bottomNavigation.dart';
import 'package:twenti_mobile/common%20widgets/top%20navigation/topNavigation.dart';

class SkeletonPageDefault extends StatefulWidget {
  const SkeletonPageDefault({Key? key}) : super(key: key);

  @override
  State<SkeletonPageDefault> createState() => _SkeletonPageDefaultState();
}

class _SkeletonPageDefaultState extends State<SkeletonPageDefault> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: const [
        TopNavigation(),
        Expanded(child: Text("")),
        BottomNavigation()
      ],
    ));
  }
}
