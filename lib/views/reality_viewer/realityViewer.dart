import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../common widgets/top navigation/topNavigation.dart';

class RealityViewer extends StatefulWidget {
  const RealityViewer({Key? key}) : super(key: key);

  @override
  State<RealityViewer> createState() => _RealityViewerState();
}

class _RealityViewerState extends State<RealityViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TopNavigation(
          left: Material(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.keyboard_arrow_left)),
          ),
        ),
        Expanded(
            child: ModelViewer(
          src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
          iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
          ar: true,
          autoRotate: true,
          cameraControls: true,
        ))
      ],
    )));
  }
}
