import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controllers/home_controller.dart';
import '../draggable_scrollable_sheet_items.dart';




class MapTabScreen extends StatelessWidget {
  MapTabScreen({
    Key key,
    this.homeController,
  }) : super(key: key);
  final HomeController homeController;

  GoogleMapController _controller;

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10.4746,
  );

  CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  setMapStyle(String mapStyle) => _controller.setMapStyle(mapStyle);

  Future<String> getJsonFile(String path) async =>
      await rootBundle.loadString(path);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
            changeMapMode();
          },
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: true,
        ),
        // Placeholder(
        //   fallbackHeight: 300,
        //   fallbackWidth: 300,
        // ),
        // NotificationListener<DraggableScrollableNotification>(
        //     onNotification: (notification) =>
        //         homeController.showOrHideArrow(notification.extent),
        //     child:

        DraggableScrollableSheet(
          initialChildSize: 0.1,
          minChildSize: 0.1,

          // maxChildSize: 0.8,
          expand: true,
          builder: (BuildContext context, scrollController) =>
              DraggableScrollableSheetItems(
            homeController: homeController,
            scrollController: scrollController,
          ),
        ),
      ],
    );
  }

  changeMapMode() => getJsonFile("assets/map_theme.json").then(setMapStyle);
}
