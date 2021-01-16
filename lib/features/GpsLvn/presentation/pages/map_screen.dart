import 'dart:async';
import 'dart:collection';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/extension_api.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:get/get.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/toggleGeofence/togglegeofence_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/toggleRoute/toggleroute_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/pages/geofences_widget.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/widgets/data.dart';
import 'package:ionicons/ionicons.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:map_elevation/map_elevation.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../core/utils/api_refrence.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../theme.dart';
import '../../domain/entities/devices.dart' as devices;
import '../blocs/devices/devices_bloc.dart';
import '../blocs/groupIcon/groupicon_cubit.dart';
import '../blocs/toggleTrack/toggletrack_cubit.dart';
import '../blocs/unitGroups/unitgroups_cubit.dart';
import '../controllers/home_controller.dart';
import '../widgets/home/animations/arrow_up_animated_page.dart';
import '../widgets/home/loading.dart';
import '../widgets/home/unitsBottomSheet/custom_expansion_tile.dart';
import '../widgets/home/unitsBottomSheet/footer_expanded_unit_children.dart';
import '../widgets/home/unitsBottomSheet/header_expanded_units_children.dart';
import '../widgets/home/unitsBottomSheet/row_units.dart';
import 'home_screen.dart';
import 'track_page.dart';

// class MovingWithoutRefreshAllMapMarkers extends StatefulWidget {
//   final  List<Marker> marker;
//   const MovingWithoutRefreshAllMapMarkers({Key key, this.marker}) : super(key: key);
//   @override
//   State<StatefulWidget> createState() =>
//       _MovingWithoutRefreshAllMapMarkersState();
// }

// class _MovingWithoutRefreshAllMapMarkersState
//     extends State<MovingWithoutRefreshAllMapMarkers> {
//   Marker _marker;
//   Timer _timer;
//   int _markerIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _marker = widget.marker[_markerIndex];
//     _timer = Timer.periodic(Duration(seconds: 1), (_) {
//       setState(() {
//         _marker = widget.marker[_markerIndex];
//         _markerIndex = (_markerIndex + 1) % widget.marker.length;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MarkerLayerWidget(
//       options: MarkerLayerOptions(markers: <Marker>[]..addAll(widget.marker)),
//     );
//   }
// }

class MapTabPage extends StatefulWidget {
  MapTabPage({
    Key key,
    this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  _MapTabPageState createState() => _MapTabPageState();
}

class _MapTabPageState extends State<MapTabPage> with TickerProviderStateMixin {
  final PopupController _popupLayerController = PopupController();

  StreamSubscription _loactationSubscrption;
  Location _locationTracker = Location();

  MapController mapController;

  List<LatLng> tappedPoints = [];
  Marker marker;

  @override
  void initState() {
    super.initState();
    marker = Marker();
    mapController = MapController();
  }

  void updateMarkerLocation(LocationData newLocalData) {
    LatLng latLng = LatLng(newLocalData.latitude, newLocalData.longitude);

    marker = Marker(
        point: latLng ?? LatLng(36.270908, 43.37498),
        builder: (_) => FlutterLogo());
  }

  void getCurrentLocation() async {
    try {
      var location = await _locationTracker.getLocation();
      updateMarkerLocation(location);

      if (_loactationSubscrption != null) {
        _loactationSubscrption.cancel();
      }

      _loactationSubscrption =
          _locationTracker.onLocationChanged().listen((newLocalData) {
        if (mapController != null) {
          mapController.move(
              LatLng(newLocalData.latitude, newLocalData.longitude), 10.0);
          updateMarkerLocation(location);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print("permisssion Denied");
      }
    }
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final _latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final _lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final _zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    var controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
          LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation)),
          _zoomTween.evaluate(animation));
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    if (_loactationSubscrption != null) {
      _loactationSubscrption.cancel();
    }
    super.dispose();
  }

  // void _handleTap(LatLng latlng) {
  //   setState(() {
  //     tappedPoints.add(latlng);
  //   });
  // }

  //    void showPopupForFirstMarker() {
  //   _popupLayerController.togglePopup(_markers.first);
  // }
  @override
  Widget build(BuildContext context) {
    // var markers = tappedPoints.map((latlng) {
    //   return Marker(
    //     width: 80.0,
    //     height: 80.0,
    //     point: latlng,
    //     builder: (ctx) => Container(
    //       child: Icon(
    //         Ionicons.ellipse,
    //         color: AppTheme2.onlineColor,
    //         // size: SizeConfig.screenWidth / 25,
    //       ),
    //     ),
    //   );
    // }).toList();
    //print("rebuilt");
    return Stack(children: [
      BlocBuilder<DevicesBloc, DevicesState>(builder: (context, state) {
        if ((state is DevicesDataLoading) || (state is DevicesInitial)) {
          return LoadingIndicatorWithMessage(label: 'Loading');
        } else if (state is DevicesDataLoaded) {
          // return Container();
          final groups = state.devices.groups;

          return FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: LatLng(36.270908, 43.37498),
              zoom: 5.0,
              //onTap: _handleTap,
              //interactive: true,
              // plugins: <MapPlugin>[PopupMarkerPlugin()],
              // onTap: (_) => _popupLayerController.hidePopup(),
            ),

            // children: [
            //   for (int index = 0; index < groups.length; index++) ...[
            //     for (int index2 = 0;
            //         index2 < groups[index].items.length;
            //         index2++) ...[
            //    MovingWithoutRefreshAllMapMarkers(marker: [ buildMarker(groups, index, index2),],),
            //         ]]
            // ],
            layers: [
              TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
                // additionalOptions: {
                //   // 'title': 'copy',
                //   // 'fresh': 'true',
                //   'accessToken':'pk.eyJ1IjoibW9oYW1tZWQtamFhZmFyIiwiYSI6ImNranYxcmkzYjA0aTEyb3Fybmh6c21oOGIifQ.y8G1cULMXmR5vAPOmG1_qQ',

                // },
                // For example purposes. It is recommended to use
                // TileProvider with a caching and retry strategy, like
                // NetworkTileProvider or CachedNetworkTileProvider
                tileProvider: NonCachingNetworkTileProvider(),
              ),
              //  TileLayerOptions(
              //       wmsOptions: WMSTileLayerOptions(
              //         baseUrl: 'https://{s}.s2maps-tiles.eu/wms/?',
              //         layers: ['s2cloudless-2018_3857'],
              //       ),
              //       subdomains: ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'],
              //     ),
              for (int index = 0; index < groups.length; index++) ...[
                for (int index2 = 0;
                    index2 < groups[index].items.length;
                    index2++) ...[
                  PolylineLayerOptions(
                    polylines: [
                          buildPolyline(groups, index, index2),
                        ] ??
                        [],
                  ),
                  PolygonLayerOptions(
                      polygons: [
                            Polygon(
                                borderColor: AppTheme2.editColor,
                                color: AppTheme2.editColor,
                                borderStrokeWidth: 100.0,
                                points: [
                                  LatLng(39.270908, 43.37498),
                                ]),
                            Polygon(
                                borderColor: AppTheme2.errorColor,
                                borderStrokeWidth: 80.0,
                                points: [
                                  LatLng(43.270908, 43.37498),
                                ]),
                          ] ??
                          []),
                  MarkerLayerOptions(
                      // popupSnap: PopupSnap.top,
                      // popupController: _popupLayerController,
                      // popupBuilder: (BuildContext _, Marker marker) =>

                      //     PopupBuilderMarkerWidget(
                      //         groups: groups, index: index, index2: index2),

                      markers: [
                    buildMarker(groups, index, index2),
                  ]..addAll([marker] ?? [])),
                ]
              ]
            ],
          );

          //else return GroupListWidget(homeController: homeController,);

        } else if (state is DevicesDataError) return Container();
      }),
      Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Align(
          alignment: Alignment.topCenter,
          child: Material(
            borderRadius: BorderRadius.circular(8),
            color: AppTheme2.whiteColor,
            child: InkWell(
              highlightColor: AppTheme2.primaryColor18,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {},
              child: Container(
                  height: SizeConfig.screenWidth / 8,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // color: AppTheme2.primaryColor20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          padding: EdgeInsets.all(0.0),
                          highlightColor: AppTheme2.primaryColor18,
                          icon: Icon(
                            Ionicons.menu_outline,
                            color: AppTheme2.primaryColor,
                          ),
                          onPressed: () => widget.homeController.openDrawer(),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                          flex: 7,
                          child: Text(
                            "Units Search ...",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: SizeConfig.screenWidth / 30,
                                    color: AppTheme2.primaryColor19),
                          )),
                    ],
                  )),
            ),
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 150, right: 20, left: 20),
          child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 45,
                width: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppTheme2.whiteColor),
                child: Icon(
                  Ionicons.information,
                  color: AppTheme2.primaryColor,
                ),
              ))),
      Padding(
          padding: const EdgeInsets.only(bottom: 80, right: 20, left: 20),
          child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 45,
                width: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppTheme2.whiteColor),
                child: IconButton(
                  icon: Icon(
                    Ionicons.navigate,
                    color: AppTheme2.primaryColor,
                  ),
                  onPressed: () => getCurrentLocation(),
                ),
              ))),

      BlocBuilder<TogglerouteCubit, bool>(builder: (context, state) {
        return DraggableScrollableSheet(
            initialChildSize: 0.40,
            minChildSize: 0.30,
            expand: true,
            builder: (BuildContext context, ScrollController scrollController) {
              if (!state)
                return Container();
              else
                return SingleChildScrollView(
                    controller: scrollController,
                    child: RoutesWidget(homeController: widget.homeController));
            });
      }),

      BlocBuilder<TogglegeofenceCubit, bool>(builder: (context, state) {
        return DraggableScrollableSheet(
            initialChildSize: 0.40,
            minChildSize: 0.30,
            expand: true,
            builder: (BuildContext context, ScrollController scrollController) {
              if (!state)
                return Container();
              else
                return SingleChildScrollView(
                    controller: scrollController,
                    child: GeoFencesWidget(
                      homeController: widget.homeController,
                    ));
            });
      }),

      BlocBuilder<ToggletrackCubit, bool>(builder: (context, state) {
        return DraggableScrollableSheet(
            initialChildSize: 0.40,
            minChildSize: 0.30,
            expand: true,
            builder: (BuildContext context, ScrollController scrollController) {
              if (!state)
                return Container();
              else
                return SingleChildScrollView(
                    controller: scrollController, child: TrackPage());
            });
      }),
      BlocBuilder<ToggletrackCubit, bool>(builder: (context, state) {
        if (!state)
          return DraggableBottomSheetWidget(
            widget.homeController,
            () => _animatedMapMove(LatLng(36.270908, 43.37498), 18.0),
          );
        else
          return Container();
      }),

      // Positioned(
      //     bottom: 0,
      //     left: 0,
      //     right: 0,
      //     height: 120,
      //     child: Container(
      //       color: Colors.white.withOpacity(0.6),
      //       child: NotificationListener<ElevationHoverNotification>(
      //           onNotification: (ElevationHoverNotification notification) {
      //             setState(() {
      //               hoverPoint = notification.position;
      //             });

      //             return true;
      //           },
      //           child: Elevation(
      //             getPoints(),
      //             color: Colors.grey,
      //             elevationGradientColors: ElevationGradientColors(
      //                 gt10: Colors.green,
      //                 gt20: Colors.orangeAccent,
      //                 gt30: Colors.redAccent),
      //           )),
      //     ))
    ]);
  }

  Polyline buildPolyline(List<devices.Group> groups, int index, int index2) {
    return Polyline(
        points: groups[index]
                .items[index2]
                .tail
                .map(
                  (e) => LatLng(double.parse(e.lat), double.parse(e.lng)),
                )
                .toList() ??
            [],
        strokeWidth: 4.0,
        // isDotted: true,
        color: AppTheme2.primaryColor);
  }

  Marker buildMarker(List<devices.Group> groups, int index, int index2) {
    return Marker(
      height: 50,
      width: 50,
      point: LatLng(groups[index].items[index2].lat,
              groups[index].items[index2].lng) ??
          [],
      builder: (_) => GestureDetector(
        onTap: () => _animatedMapMove(
            LatLng(groups[index].items[index2].lat,
                groups[index].items[index2].lng),
            18.0),
        child: RotatedBox(
            quarterTurns: groups[index].items[index2].course,
            child: Container(
                child: CachedNetworkImage(
              imageUrl:
                  "${ApiRefrence.publicDomain}${groups[index].items[index2].icon.path}",
              fit: BoxFit.contain,
              //  placeholder: (context, url) => Container(color: Theme.of(context).focusColor,),
              //               errorWidget: (context, url, error) => Image.asset("assets/car2.png",height: 24,
              //               width: 24,),
            ))),
      ),
      anchorPos: AnchorPos.align(AnchorAlign.top),
    );
  }
}

class PopupBuilderMarkerWidget extends StatelessWidget {
  const PopupBuilderMarkerWidget({
    Key key,
    @required this.groups,
    @required this.index,
    @required this.index2,
  }) : super(key: key);

  final List<devices.Group> groups;
  final int index;
  final int index2;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        color: AppTheme2.whiteColor,
        child: Row(
          children: [
            Container(
              width: 10,
              color: AppTheme2.errorColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              Ionicons.speedometer_outline,
              color: AppTheme2.primaryColor,
              size: SizeConfig.screenWidth / 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${groups[index].items[index2].speed}',
              style: Theme.of(context).textTheme.headline5.copyWith(
                  fontSize: SizeConfig.screenWidth / 25,
                  color: AppTheme2.primaryColor),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${groups[index].items[index2].name}',
              style: Theme.of(context).textTheme.headline5.copyWith(
                  fontSize: SizeConfig.screenWidth / 25,
                  color: AppTheme2.primaryColor19),
            )
          ],
        ));
  }
}

class DraggableBottomSheetWidget extends HookWidget {
  const DraggableBottomSheetWidget(this.homeController, this.handleTap,
      {Key key})
      : super(key: key);
  final HomeController homeController;
  final GestureTapCallback handleTap;

  @override
  Widget build(BuildContext context) {
    final hideFabAnimController = useAnimationController(
        duration: kThemeAnimationDuration, initialValue: 1);

    // final scrollController2 =
    //     useScrollControllerForAnimation(hideFabAnimController);

    return DraggableScrollableSheet(
        initialChildSize: 0.07,
        minChildSize: 0.07,
        expand: true,
        builder: (BuildContext context, ScrollController scrollController) {
          return NotificationListener<DraggableScrollableNotification>(
              onNotification: (notification) {
                print(notification.extent);

                if (notification.extent > 0.07) {
                  hideFabAnimController.reverse();
                } else {
                  hideFabAnimController.forward();
                }
                return false;
              },
              child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      FadeTransition(
                        opacity: hideFabAnimController,
                        child: ScaleTransition(
                            scale: hideFabAnimController,
                            child: AnimatedArrowPage()),
                      ),
                      Container(
                          color: AppTheme2.primaryColor20,
                          padding: const EdgeInsets.all(0),
                          width: double.infinity,
                          height: SizeConfig.screenHeight,
                          child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Container(
                                    height: 5.5,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: AppTheme2.primaryColor22),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Units Menue",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                        color: AppTheme2.primaryColor18,
                                        fontSize: SizeConfig.screenWidth / 23,
                                      ),
                                ),
                                UnitsMenueHeader(
                                  homeController: homeController,
                                ),
                                const Divider(
                                  color: AppTheme2.clearColor,
                                  height: 2,
                                ),
                                BlocBuilder<DevicesBloc, DevicesState>(
                                    builder: (context, state) {
                                  if ((state is DevicesDataLoading) ||
                                      (state is DevicesInitial)) {
                                    return LoadingIndicatorWithMessage(
                                        label: 'Loading');
                                  } else if (state is DevicesDataLoaded) {
                                    return Column(children: [
                                      for (int index = 0;
                                          index < state.devices.groups.length;
                                          index++) ...[
                                        for (int index2 = 0;
                                            index2 <
                                                state.devices.groups[index]
                                                    .items.length;
                                            index2++) ...[
                                          BlocBuilder<UnitgroupsCubit, bool>(
                                              builder: (context, state2) {
                                            if (!state2)
                                              return RowUnitsWidget(
                                                groups: state.devices.groups,
                                                handleTap: handleTap,
                                                index2: index2,
                                                index: index,
                                              );
                                            else
                                              return GroupListWidget(
                                                homeController: homeController,
                                                groups: state.devices.groups,
                                                index: index,
                                                index2: index2,
                                              );
                                          }),
                                        ]
                                      ]
                                    ]);
                                  } else if (state is DevicesDataError)
                                    return Container();
                                })
                              ])))
                    ],
                  )

                  //  Container(
                  //   color: AppTheme2.primaryColor20,
                  //   child: BlocBuilder<DevicesBloc, DevicesState>(
                  //     builder: (context, state) {
                  //       if ((state is DevicesDataLoading) ||
                  //           (state is DevicesInitial)) {
                  //         return LoadingIndicatorWithMessage(label: 'Loading');
                  //       } else if (state is DevicesDataLoaded) {
                  //         // return Container();

                  //         return ListView.builder(
                  //             controller: scrollController,
                  //             itemCount: state.devices.groups.length,
                  //             shrinkWrap: true,
                  //             itemBuilder: (BuildContext context, int index) {
                  //               return Column(children: [
                  //                 index == 0
                  //                     ?
                  //                     : Container(color: Colors.transparent,),

                  //                 index == 0
                  //                     ? Center(
                  //                         child: Container(
                  //                           height: 5.5,
                  //                           width: 45,

                  //                           decoration: BoxDecoration(
                  //                               borderRadius:
                  //                                   BorderRadius.circular(50),
                  //                               color: AppTheme2.primaryColor22),
                  //                         ),
                  //                       )
                  //                     : Container(),
                  //                     const SizedBox(height: 10,),

                  //                 index == 0
                  //                     ? Text(
                  //                         "Units Menue",
                  //                         style: Theme.of(context)
                  //                             .textTheme
                  //                             .headline5
                  //                             .copyWith(
                  //                               color: AppTheme2.primaryColor18,
                  //                               fontSize: SizeConfig.screenWidth / 23,
                  //                             ),
                  //                       )
                  //                     : Container(),
                  //                 index == 0
                  //                     ? UnitsMenueHeader(
                  //                         homeController: homeController,
                  //                       )
                  //                     : Container(),
                  //                 index == 0
                  //                     ? const Divider(
                  //                         color: AppTheme2.clearColor,
                  //                         height: 2,
                  //                       )
                  //                     : Container(),

                  //                 for (int index2 = 0;
                  //                     index2 <
                  //                         state.devices.groups[index].items.length;
                  //                     index2++) ...[
                  //                   BlocBuilder<UnitgroupsCubit, bool>(
                  //                       builder: (context, state2) {
                  //                     if (!state2)
                  //                       return RowUnitsWidget(
                  //                         groups: state.devices.groups,
                  //                         handleTap: handleTap,
                  //                         index2: index2,
                  //                         index: index,
                  //                       );
                  //                     else
                  //                       return GroupListWidget(
                  //                         homeController: homeController,
                  //                         groups: state.devices.groups,
                  //                         index: index,
                  //                         index2: index2,
                  //                       );
                  //                   }),
                  //                 ]
                  //                 // UnitsMenueBottomSheet(
                  //                 //   homeController: homeController,
                  //                 //   handleTap: handleTap,
                  //                 //   state: state,
                  //                 //   index2: index2,
                  //                 //   index: index,
                  //                 // )
                  //               ]);
                  //             });

                  //         //else return GroupListWidget(homeController: homeController,);

                  //       } else if (state is DevicesDataError) return Container();
                  //     },
                  //   ),
                  // ),
                  ));
        });
  }
}

class GroupListWidget extends StatelessWidget {
  const GroupListWidget({
    Key key,
    this.groups,
    this.homeController,
    this.index,
    this.index2,
  }) : super(key: key);

  final List<devices.Group> groups;
  final HomeController homeController;
  final int index, index2;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Flexible(
            child: Checkbox(
              value: null,
              onChanged: (bool value) =>
                  context.read<GroupiconCubit>().expandOrCollapse(),
              tristate: true,
              activeColor: AppTheme2.primaryColor18,
              checkColor: AppTheme2.primaryColor20,
            ),
          ),
          Flexible(
            child: Checkbox(
              value: false,
              onChanged: (bool value) {},

              //tristate: true,
              activeColor: AppTheme2.primaryColor18,
              checkColor: AppTheme2.primaryColor20,
            ),
          ),
          SizedBox(
            width: 10,
          ),

          Flexible(
            child: Text(
              "${groups[index].title}",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: SizeConfig.screenWidth / 35,
                  color: AppTheme2.primaryColor18),
            ),
          ),

          // Flexible(

          //     child: Container(
          //       padding: const EdgeInsets.all(0),
          //       child: Text(
          //         "Gro",
          //         style: Theme.of(context).textTheme.headline6.copyWith(
          //             fontSize: SizeConfig.screenWidth / 30,
          //             color: AppTheme2.primaryColor18),
          //       ),
          //     )),
          for (int i = 0; i < 6; i++)
            Flexible(
              child: ClipOval(
                  child: IconButton(
                highlightColor: AppTheme2.primaryColor21,
                icon: Icon(
                  Ionicons.cog_outline,
                  color: AppTheme2.primaryColor20,
                  // size: SizeConfig.screenWidth / 25,
                ),
                onPressed: () {},
              )),
            ),
          Flexible(
            child: ClipOval(
                child: Material(
                    color: AppTheme2.primaryColor20,
                    child: IconButton(
                      highlightColor: AppTheme2.primaryColor21,
                      icon: Icon(
                        Ionicons.cog_outline,
                        color: AppTheme2.primaryColor18,
                        // size: SizeConfig.screenWidth / 25,
                      ),
                      onPressed: () => showCupertinoModalBottomSheet(
                        expand: true,
                        bounce: true,
                        context: context,
                        backgroundColor: AppTheme2.primaryColor,
                        builder: (context) =>
                            viewGroupdetailsBottomSheet(context),
                      ),
                    ))),
          ),
          Flexible(
            child: ClipOval(
                child: Material(
                    color: AppTheme2.primaryColor20,
                    child: IconButton(
                      highlightColor: AppTheme2.primaryColor21,
                      icon: Icon(
                        Ionicons.close_outline,
                        color: AppTheme2.clearColor,
                        // size: SizeConfig.screenWidth / 25,
                      ),
                      onPressed: () {
                        print("hi");
                      },
                    ))),
          ),
        ],
      ),
      BlocBuilder<GroupiconCubit, bool>(builder: (context, state) {
        return Column(children: [
          state
              ? CustomExpansionTile(
                  unitName: "${groups[index].items[index2].name}",
                  tilePadding: const EdgeInsets.all(0.0),
                  imageUrl:
                      "${ApiRefrence.publicDomain}${groups[index].items[index2].icon.path}",
                  childrenPadding: const EdgeInsets.all(8.0),
                  children: [
                    UnitRowHeaderDetails(),
                    UnitFooterDetails(),
                  ],
                )
              : Container(),
          state
              ? Divider(
                  color: AppTheme2.clearColor,
                  height: 2,
                )
              : Container()
        ]);
      }),
    ]);
  }

  Widget viewGroupdetailsBottomSheet(context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppTheme2.primaryColor,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Container(
              height: 5.5,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppTheme2.primaryColor11),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => homeController.saved.isNotEmpty
                    ? Text(
                        "Cancel",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: AppTheme2.territoryColor,
                              fontSize: SizeConfig.screenWidth / 25,
                            ),
                      )
                    : Container(),
              ),
              Text(
                "Group Name",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: AppTheme2.primaryColor18,
                      fontSize: SizeConfig.screenWidth / 23,
                    ),
              ),
              Obx(
                () => homeController.saved.isNotEmpty
                    ? Text(
                        "Add",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: AppTheme2.territoryColor,
                              fontSize: SizeConfig.screenWidth / 25,
                            ),
                      )
                    : Container(),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Material(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme2.primaryColor20,
              child: InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () {},
                child: Container(
                    height: SizeConfig.screenWidth / 8,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: AppTheme2.primaryColor20,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.search_outline,
                          color: AppTheme2.primaryColor18,
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          "Search",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: SizeConfig.screenWidth / 30,
                              color: AppTheme2.primaryColor18),
                        )
                      ],
                    )),
              )),
          SizedBox(
            height: 30,
          ),
          for (int index = 0;
              index < homeController.homeList.length;
              index++) ...[
            Material(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme2.primaryColor20,
              child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onTap: () => homeController.selectUnitToAddToView(index),
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "${homeController.homeList[index].image}",
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text(
                    "${homeController.homeList[index].unitName}",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: AppTheme2.primaryColor18,
                          fontSize: SizeConfig.screenWidth / 25,
                        ),
                  ),
                  subtitle: Text(
                    "${homeController.homeList[index].location}",
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          color: AppTheme2.primaryColor16,
                          fontSize: SizeConfig.screenWidth / 28,
                        ),
                  ),
                  trailing: Obx(
                    () => Icon(
                      homeController.homeList[index].isSelected
                          ? Ionicons.checkmark_circle_outline
                          : Ionicons.radio_button_off_outline,
                      color: homeController.homeList[index].isSelected
                          ? AppTheme2.territoryColor
                          : AppTheme2.primaryColor18,
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            )
          ]
        ]),
      ),
    );
  }
}

class UnitsMenueBottomSheet extends StatelessWidget {
  const UnitsMenueBottomSheet({
    Key key,
    @required this.homeController,
    this.handleTap,
    this.state,
    this.index,
    this.index2,
  }) : super(key: key);

  final HomeController homeController;
  final GestureTapCallback handleTap;
  final DevicesDataLoaded state;
  final int index, index2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
      width: double.infinity,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(color: AppTheme2.primaryColor20),
      child: SingleChildScrollView(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                height: 5.5,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppTheme2.primaryColor22),
              ),
            ),

            Text(
              "Units Menue",
              style: Theme.of(context).textTheme.headline5.copyWith(
                    color: AppTheme2.primaryColor18,
                    fontSize: SizeConfig.screenWidth / 23,
                  ),
            ),
            UnitsMenueHeader(
              homeController: homeController,
            ),
            const Divider(
              color: AppTheme2.clearColor,
              height: 2,
            ),

            // return Container();

            BlocBuilder<UnitgroupsCubit, bool>(builder: (context, state2) {
              if (!state2)
                return RowUnitsWidget(
                  groups: state.devices.groups,
                  handleTap: handleTap,
                  index2: index2,
                  index: index,
                );
              else
                return GroupListWidget(
                  homeController: homeController,
                  groups: state.devices.groups,
                  index: index,
                  index2: index2,
                );
            }),

            //else return GroupListWidget(homeController: homeController,);

            // BlocBuilder<AnimatediconCubit, bool>(builder: (context, state) {
            //   if (!state)
            //     return const SizedBox();
            //   else
            //     return Padding(
            //       padding: const EdgeInsets.all(18.0),
            //       child: Column(
            //         children: [
            //           const UnitRowHeaderDetails(),
            //           const SizedBox(
            //             height: 10,
            //           ),
            //           const UnitFooterDetails()
            //         ],
            //       ),
            //     );
            // }),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
    //   ],
    // );
  }
}

class UnitsMenueHeader extends StatelessWidget {
  const UnitsMenueHeader({
    Key key,
    this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<UnitgroupsCubit, bool>(builder: (context, state) {
          if (state)
            return Flexible(
              child: Checkbox(
                value: null,
                onChanged: (bool value) {
                  // homeController.showUnit(
                  //     index, value);
                },
                tristate: true,
                activeColor: AppTheme2.primaryColor18,
                checkColor: AppTheme2.primaryColor20,
              ),
            );
          else
            return Container();
        }),
        Flexible(
          child: Checkbox(
            value: false,
            onChanged: (bool value) {
              // homeController.showUnit(
              //     index, value);
            },
            //tristate: true,
            activeColor: AppTheme2.primaryColor18,
            checkColor: AppTheme2.primaryColor20,
          ),
        ),
        Flexible(
          child: ClipOval(
              child: Material(
                  color: AppTheme2.primaryColor20,
                  child: IconButton(
                    highlightColor: AppTheme2.primaryColor21,
                    icon: Icon(
                      Ionicons.text_outline,
                      color: AppTheme2.primaryColor18,
                      // size: SizeConfig.screenWidth / 25,
                    ),
                    onPressed: () {
                      print("hi");
                    },
                  ))),
        ),
        BlocBuilder<UnitgroupsCubit, bool>(builder: (context, state) {
          return Flexible(
            child: ClipOval(
                child: Material(
                    color: AppTheme2.primaryColor20,
                    child: IconButton(
                        highlightColor: AppTheme2.primaryColor21,
                        icon: Icon(
                          state
                              ? Ionicons.list_outline
                              : Ionicons.list_circle_outline,
                          color: AppTheme2.primaryColor18,
                          // size: SizeConfig.screenWidth / 25,
                        ),
                        onPressed: () {
                          context.read<UnitgroupsCubit>().showGroupsOrUnits();
                        }))),
          );
        }),
        Flexible(
          child: ClipOval(
              child: Material(
                  color: AppTheme2.primaryColor20,
                  child: IconButton(
                    highlightColor: AppTheme2.primaryColor21,
                    icon: Icon(
                      Ionicons.location_outline,
                      color: AppTheme2.primaryColor18,
                      // size: SizeConfig.screenWidth / 25,
                    ),
                    onPressed: () {
                      print("hi");
                    },
                  ))),
        ),
        Flexible(
          child: ClipOval(
              child: Material(
                  color: AppTheme2.primaryColor20,
                  child: IconButton(
                    highlightColor: AppTheme2.primaryColor21,
                    icon: Icon(
                      Ionicons.add_outline,
                      color: AppTheme2.primaryColor18,
                      // size: SizeConfig.screenWidth / 25,
                    ),
                    onPressed: () => showCupertinoModalBottomSheet(
                      expand: true,
                      bounce: true,
                      context: context,
                      backgroundColor: AppTheme2.primaryColor,
                      builder: (context) => addUnitsToViewBottomSheet(context),
                    ),
                  ))),
        ),
        Flexible(
          child: ClipOval(
              child: Material(
                  color: AppTheme2.primaryColor20,
                  child: IconButton(
                      highlightColor: AppTheme2.primaryColor21,
                      icon: Icon(
                        Ionicons.add_circle_outline,
                        color: AppTheme2.primaryColor18,
                        // size: SizeConfig.screenWidth / 25,
                      ),
                      onPressed: () {}))),
        ),
        Flexible(
          child: ClipOval(
              child: Material(
                  color: AppTheme2.primaryColor20,
                  child: IconButton(
                    highlightColor: AppTheme2.primaryColor21,
                    icon: Icon(
                      Ionicons.car_outline,
                      color: AppTheme2.primaryColor18,
                      // size: SizeConfig.screenWidth / 25,
                    ),
                    onPressed: () {
                      print("hi");
                    },
                  ))),
        ),
        Flexible(
          child: ClipOval(
              child: Material(
                  color: AppTheme2.primaryColor20,
                  child: IconButton(
                    highlightColor: AppTheme2.primaryColor21,
                    icon: Icon(
                      Ionicons.globe_outline,
                      color: AppTheme2.primaryColor18,
                      // size: SizeConfig.screenWidth / 25,
                    ),
                    onPressed: () {
                      print("hi");
                    },
                  ))),
        ),
        Flexible(
          child: ClipOval(
              child: Material(
                  color: AppTheme2.primaryColor20,
                  child: IconButton(
                    highlightColor: AppTheme2.primaryColor21,
                    icon: Icon(
                      Ionicons.wifi_outline,
                      color: AppTheme2.primaryColor18,
                      // size: SizeConfig.screenWidth / 25,
                    ),
                    onPressed: () {
                      print("hi");
                    },
                  ))),
        ),
        Flexible(
          child: ClipOval(
              child: Material(
                  color: AppTheme2.primaryColor20,
                  child: IconButton(
                    highlightColor: AppTheme2.primaryColor21,
                    icon: Icon(
                      Ionicons.close_outline,
                      color: AppTheme2.clearColor,
                      // size: SizeConfig.screenWidth / 25,
                    ),
                    onPressed: () {
                      print("hi");
                    },
                  ))),
        ),
      ],
    );
  }

  Widget addUnitsToViewBottomSheet(context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppTheme2.primaryColor,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Container(
              height: 5.5,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppTheme2.primaryColor11),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => homeController.saved.isNotEmpty
                    ? Text(
                        "Cancel",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: AppTheme2.territoryColor,
                              fontSize: SizeConfig.screenWidth / 25,
                            ),
                      )
                    : Container(),
              ),
              Text(
                "Add Units To View",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: AppTheme2.primaryColor18,
                      fontSize: SizeConfig.screenWidth / 23,
                    ),
              ),
              Obx(
                () => homeController.saved.isNotEmpty
                    ? Text(
                        "Add",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: AppTheme2.territoryColor,
                              fontSize: SizeConfig.screenWidth / 25,
                            ),
                      )
                    : Container(),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Material(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme2.primaryColor20,
              child: InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () {},
                child: Container(
                    height: SizeConfig.screenWidth / 8,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: AppTheme2.primaryColor20,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.search_outline,
                          color: AppTheme2.primaryColor18,
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          "Search",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: SizeConfig.screenWidth / 30,
                              color: AppTheme2.primaryColor18),
                        )
                      ],
                    )),
              )),
          SizedBox(
            height: 30,
          ),
          for (int index = 0;
              index < homeController.homeList.length;
              index++) ...[
            Material(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme2.primaryColor20,
              child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onTap: () => homeController.selectUnitToAddToView(index),
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "${homeController.homeList[index].image}",
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text(
                    "${homeController.homeList[index].unitName}",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: AppTheme2.primaryColor18,
                          fontSize: SizeConfig.screenWidth / 25,
                        ),
                  ),
                  subtitle: Text(
                    "${homeController.homeList[index].location}",
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          color: AppTheme2.primaryColor16,
                          fontSize: SizeConfig.screenWidth / 28,
                        ),
                  ),
                  trailing: Obx(
                    () => Icon(
                      homeController.homeList[index].isSelected
                          ? Ionicons.checkmark_circle_outline
                          : Ionicons.radio_button_off_outline,
                      color: homeController.homeList[index].isSelected
                          ? AppTheme2.territoryColor
                          : AppTheme2.primaryColor18,
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            )
          ]
        ]),
      ),
    );
  }
}
