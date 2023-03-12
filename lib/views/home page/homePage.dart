import 'package:flutter/cupertino.dart';
import 'package:twenti_mobile/common%20widgets/skeletons/skeletonPageDefault.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SkeletonPageDefault();
  }
}
