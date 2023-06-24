import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../services/location/currentLocation.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  var currentPosition;
  final markerList = {
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(10.768569, 106.689946),
        infoWindow: InfoWindow(
          title: "Chi nhánh 1",
        ),
        onTap: () {
          print("huy");
        }),
    Marker(
        markerId: MarkerId("2"),
        position: LatLng(10.761828323251471, 106.68343602348997)),
    Marker(
        markerId: MarkerId("3"),
        position: LatLng(10.769821636600472, 106.6700156604052)),
    Marker(
        markerId: MarkerId("4"),
        position: LatLng(10.79050603641339, 106.68831586075733))
  };

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   determinePosition().then((value) {
  //     print("position loading");
  //     currentPosition = value;
  //     print(value);
  //     super.initState();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: determinePosition(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            currentPosition = snapshot.data!;
            return Stack(alignment: Alignment.bottomLeft, children: [
              GoogleMap(
                markers: this.markerList,
                mapType: MapType.hybrid,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      currentPosition.latitude, currentPosition.longitude),
                  zoom: 20,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                padding: EdgeInsets.only(
                  top: 50.0,
                ),
                myLocationEnabled: true,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Material(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black, // button color
                  child: InkWell(
                    splashColor: Colors.white70,
                    onTap: () {
                      _goToNearest();
                    }, // button pressed

                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.store,
                            color: Colors.white,
                          ), // icon
                          Text(
                            "Gần nhất",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ), // text
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]);
          } else
            return Container();
        },
      ),
    );
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<void> _goToNearest() async {
    double minDistance = 0;
    var minMarkerId;
    this.markerList.forEach((element) {
      var distance = calculateDistance(
          currentPosition.latitude,
          currentPosition.longitude,
          element.position.latitude,
          element.position.longitude);
      if (minDistance > distance || minDistance == 0) {
        minDistance = distance;
        minMarkerId = element;
      }
    });

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        bearing: 0, target: minMarkerId.position, tilt: 0, zoom: 20)));
  }
}
