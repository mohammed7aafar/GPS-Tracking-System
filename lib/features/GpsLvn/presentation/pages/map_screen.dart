import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpsLVN/core/utils/api_refrence.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/toggleMap/togglemap_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/widgets/home/unitsBottomSheet/footer_expanded_unit_children.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/widgets/home/unitsBottomSheet/header_expanded_units_children.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../theme.dart';
import '../../domain/entities/devices.dart' as devices;
import '../blocs/map/map_bloc.dart';
import '../blocs/toggleGeofence/togglegeofence_cubit.dart';
import '../blocs/toggleRoute/toggleroute_cubit.dart';
import '../blocs/toggleTrack/toggletrack_cubit.dart';
import '../blocs/unitGroups/unitgroups_cubit.dart';
import '../widgets/home/unitsBottomSheet/group_expansion_panel.dart';
import '../widgets/home/unitsBottomSheet/row_units.dart';
import 'geofences_widget.dart';
import 'home_screen.dart';
import 'track_page.dart';

class MapTabPage extends StatefulWidget {
  MapTabPage({
    Key key,
  }) : super(key: key);

  @override
  _MapTabPageState createState() => _MapTabPageState();
}

class _MapTabPageState extends State<MapTabPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  final Completer<GoogleMapController> _mapController = Completer();
  final Map<MarkerId, Marker> markers = {};
  final Map<PolylineId, Polyline> polylines = {};
  void _onMapCreated(GoogleMapController controller) {
    if (!_mapController.isCompleted) {
      _mapController.complete(controller);
    }
  }

  Future<void> moveToLocation(latitude, longitude) async {
    print("invoked");
    GoogleMapController controller = await _mapController.future;
    CameraPosition _newPos = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 20.5,
    );

    controller.animateCamera(CameraUpdate.newCameraPosition(_newPos));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // BlocBuilder<DevicesBloc, DevicesState>(builder: (context, state) {
      //   if ((state is DevicesDataLoading) || (state is DevicesInitial)) {
      //     return LoadingIndicatorWithMessage(label: 'Loading');
      //   } else if (state is DevicesDataLoaded) {
      //     final groups = state.devices.groups;
      //     return

      // BlocBuilder<FlutterMapBloc, MapState>(
      // builder: (context, state) {
      //   return

      BlocBuilder<FlutterMapBloc, MapState>(builder: (context, state) {
        if (state is ItemsLoadSuccess) {
          state.items.forEach((el) {
            final MarkerId _markerId = MarkerId(el.id.toString());
            final PolylineId _polylineId = PolylineId(el.id.toString());

            Marker _marker = Marker(
                markerId: _markerId,
                position: LatLng(el.lat, el.lng),
                infoWindow: InfoWindow(
                  title: el.name,
                  snippet: '${el.address}',
                ),
                icon: BitmapDescriptor.defaultMarker,
                onTap: () => moveToLocation(el.lat, el.lng));

            Polyline _polyline = Polyline(
                polylineId: _polylineId,
                width: 2,
                points: el.tail
                    .map(
                        (e) => LatLng(double.parse(e.lat), double.parse(e.lng)))
                    .toList());
            markers[_markerId] = _marker.copyWith(
                visibleParam: el.deviceData.checked == "0" ? false : true);
            polylines[_polylineId] = _polyline.copyWith(
                visibleParam: el.deviceData.checked == "0" ? false : true);
          });
          return GoogleMap(
            onMapCreated: _onMapCreated,
            markers: Set<Marker>.of(state.items != null ? markers.values : []),
            polylines:
                Set<Polyline>.of(state.items != null ? polylines.values : []),
            myLocationEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(33, 33),
              zoom: 5.0,
            ),
          );
        } else {
          return Center(child: const CircularProgressIndicator());
        }
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
                            onPressed: () {}),
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
                    onPressed: () {}
                    // getCurrentLocation(),
                    ),
              ))),

      // BlocBuilder<TogglerouteCubit, bool>(builder: (context, state) {
      //   return DraggableScrollableSheet(
      //       initialChildSize: 0.40,
      //       minChildSize: 0.30,
      //       expand: true,
      //       builder: (BuildContext context, ScrollController scrollController) {
      //         if (!state)
      //           return Container();
      //         else
      //           return SingleChildScrollView(
      //               controller: scrollController, child: RoutesWidget());
      //       });
      // }),

      // BlocBuilder<TogglegeofenceCubit, bool>(builder: (context, state) {
      //   return DraggableScrollableSheet(
      //       initialChildSize: 0.40,
      //       minChildSize: 0.30,
      //       expand: true,
      //       builder: (BuildContext context, ScrollController scrollController) {
      //         if (!state)
      //           return Container();
      //         else
      //           return SingleChildScrollView(
      //               controller: scrollController, child: GeoFencesWidget());
      //       });
      // }),

      // BlocBuilder<ToggletrackCubit, bool>(builder: (context, state) {
      //   return DraggableScrollableSheet(
      //       initialChildSize: 0.40,
      //       minChildSize: 0.30,
      //       expand: true,
      //       builder: (BuildContext context, ScrollController scrollController) {
      //         if (!state)
      //           return Container();
      //         else
      //           return SingleChildScrollView(
      //               controller: scrollController, child: TrackPage());
      //       });
      // }),
      BlocBuilder<TogglemapCubit, bool>(builder: (context, state) {
        if (!state)
          return DraggableBottomSheetWidget(
            gestureTapCallback: (LatLng latLng) {
              moveToLocation(latLng.latitude, latLng.longitude);
            },
          );
        //  final lat = context.bloc<FocusedunitBloc> ().state.latitude;
        //    final lng = context.bloc<FocusedunitBloc>().state.longitude;
        //    moveToLocation(lat,lng);
        else
          return Container();
      }),
    ]);
  }
}

class DraggableBottomSheetWidget extends StatelessWidget {
  const DraggableBottomSheetWidget({Key key, this.gestureTapCallback})
      : super(key: key);

  final dynamic gestureTapCallback;

  _onChange(LatLng latLng) {
    gestureTapCallback(latLng);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.07,
        minChildSize: 0.07,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
              color: AppTheme2.primaryColor20,
              child: BlocBuilder<FlutterMapBloc, MapState>(
                  builder: (context, state) {
                if (state is ItemsLoadSuccess) {
                  return BlocBuilder<UnitgroupsCubit, bool>(
                      builder: (context, state2) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(0.0),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            index == 0
                                ? const SizedBox(
                                    height: 10,
                                  )
                                : Container(),

                            index == 0
                                ? Center(
                                    child: Container(
                                      height: 5.5,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: AppTheme2.primaryColor22),
                                    ),
                                  )
                                : Container(),
                            index == 0
                                ? const SizedBox(
                                    height: 10,
                                  )
                                : Container(),

                            index == 0
                                ? Text("Units Menue",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(
                                          color: AppTheme2.primaryColor18,
                                          fontSize: SizeConfig.screenWidth / 23,
                                        ))
                                : Container(),
                            // ),
                            index == 0 ? UnitsMenueHeader() : Container(),

                            index == 0
                                ? const Divider(
                                    color: AppTheme2.clearColor,
                                    height: 2,
                                  )
                                : Container(),

                            if (!state2)
                              RowUnitsWidget(
                                  item: state.items[index],
                                  gestureTapCallback: _onChange)
                            else
                              GroupListWidget(
                                group: state.groups[index],
                                gestureTapCallback: gestureTapCallback,
                              )
                          ],
                        );
                      },
                      itemCount:
                          !state2 ? state.items.length : state.groups.length,
                      controller: scrollController,
                    );
                  });
                } else {
                  return Center(child: const CircularProgressIndicator());
                }
              }));
        });
  }
}

class GroupListWidget extends StatelessWidget {
  const GroupListWidget({
    Key key,
    this.group,
    this.gestureTapCallback,
  }) : super(key: key);

  final devices.Group group;
  final dynamic gestureTapCallback;

  _onChange(LatLng latLng) {
    gestureTapCallback(latLng);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme2.primaryColor20,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: ListTile(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: AppTheme2.primaryColor20,
                    context: context,
                    builder: (context) {
                      return Wrap(spacing: 10.0, children: [
                        const SizedBox(
                          height: 10,
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
                          height: 10,
                        ),
                        Center(
                            child: Text("Group Units",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                      color: AppTheme2.primaryColor18,
                                      fontSize: SizeConfig.screenWidth / 23,
                                    ))),
                        const SizedBox(
                          height: 10,
                        ),
                        group.items.length > 0
                            ? SizedBox(
                                height: 4000,
                                child: ListView.builder(
                                  
                                  itemCount: group.items.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return RowUnitsWidget(
                                        item: group.items[index],
                                        gestureTapCallback: _onChange);
                                  },
                                ),
                              )
                            : Container()
                      ]);
                    });
              },
              contentPadding: const EdgeInsets.all(0.0),
              title: Row(
                children: [
                  // Flexible(
                  //   child: Checkbox(
                  //     value: null,
                  //     onChanged: (bool value) {},
                  //     tristate: true,
                  //     activeColor: AppTheme2.primaryColor18,
                  //     checkColor: AppTheme2.primaryColor20,
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 5,
                  // ),
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
                    width: 30,
                  ),
                  Flexible(
                    child: FractionallySizedBox(
                        widthFactor: 2,
                        child: Text(
                          "${group.title}",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: SizeConfig.screenWidth / 35,
                              color: AppTheme2.primaryColor18),
                        )),
                  ),
                  for (int i = 0; i < 6; i++)
                    Flexible(
                        child: FractionallySizedBox(
                            widthFactor: 2, child: Container())),
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
            ),
          ),
          Divider(
            color: AppTheme2.clearColor,
            height: 2,
          ),
        ],
      ),
    );
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
              Text(
                "Cancel",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: AppTheme2.territoryColor,
                      fontSize: SizeConfig.screenWidth / 25,
                    ),
              ),
              Text(
                "Group Name",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: AppTheme2.primaryColor18,
                      fontSize: SizeConfig.screenWidth / 23,
                    ),
              ),
              Text(
                "Add",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: AppTheme2.territoryColor,
                      fontSize: SizeConfig.screenWidth / 25,
                    ),
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
          for (int index = 0; index < 3; index++) ...[
            Material(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme2.primaryColor20,
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onTap: () {},
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: Image.asset(
                  //   "${homeController.homeList[index].image}",
                  //   fit: BoxFit.contain,
                  // ),
                ),
                title: Text(
                  "unit",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: AppTheme2.primaryColor18,
                        fontSize: SizeConfig.screenWidth / 25,
                      ),
                ),
                subtitle: Text(
                  "sub",
                  style: Theme.of(context).textTheme.headline2.copyWith(
                        color: AppTheme2.primaryColor16,
                        fontSize: SizeConfig.screenWidth / 28,
                      ),
                ),
                // trailing:
                // Obx(
                //   () =>
                //     Icon(
                //   homeController.homeList[index].isSelected
                //       ? Ionicons.checkmark_circle_outline
                //       : Ionicons.radio_button_off_outline,
                //   color: homeController.homeList[index].isSelected
                //       ? AppTheme2.territoryColor
                //       : AppTheme2.primaryColor18,
                // ),
              ),
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

class UnitsMenueHeader extends StatelessWidget {
  const UnitsMenueHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // BlocBuilder<UnitgroupsCubit, bool>(builder: (context, state) {
        //   if (state)
        //     return Flexible(
        //       child: Checkbox(
        //         value: null,
        //         onChanged: (bool value) {
        //           // homeController.showUnit(
        //           //     index, value);
        //         },
        //         tristate: true,
        //         activeColor: AppTheme2.primaryColor18,
        //         checkColor: AppTheme2.primaryColor20,
        //       ),
        //     );
        //   else
        //     return Container();
        // }),
        BlocBuilder<FlutterMapBloc, MapState>(builder: (context, state) {
          if (state is ItemsLoadSuccess) {
            // bool notComplete = (BlocProvider.of<FlutterMapBloc>(context).state
            //       as ItemsLoadSuccess)
            //   .items
            //   .where((item) => item.deviceData.checked == "0" ? false : true);

            bool allComplete = (BlocProvider.of<FlutterMapBloc>(context).state
                    as ItemsLoadSuccess)
                .items
                .every((item) => item.deviceData.checked == "0" ? false : true);

            return Flexible(
              child: Checkbox(
                value: allComplete ? true : null,
                onChanged: (bool value) {
                  BlocProvider.of<FlutterMapBloc>(context).add(ToggleAll());
                },
               
                tristate: allComplete ? false : true,
                activeColor: AppTheme2.primaryColor18,
                checkColor: AppTheme2.primaryColor20,
              ),
            );
          } else {
            return Container();
          }
        }),
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
              Text(
                "Cancel",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: AppTheme2.territoryColor,
                      fontSize: SizeConfig.screenWidth / 25,
                    ),
              ),
              Text(
                "Add Units To View",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: AppTheme2.primaryColor18,
                      fontSize: SizeConfig.screenWidth / 23,
                    ),
              ),
              Text(
                "Add",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: AppTheme2.territoryColor,
                      fontSize: SizeConfig.screenWidth / 25,
                    ),
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
          for (int index = 0; index < 3; index++) ...[
            Material(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme2.primaryColor20,
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onTap: () {},
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: Image.asset(
                  //   "${homeController.homeList[index].image}",
                  //   fit: BoxFit.contain,
                  // ),
                ),
                title: Text(
                  "unitname",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: AppTheme2.primaryColor18,
                        fontSize: SizeConfig.screenWidth / 25,
                      ),
                ),
                subtitle: Text(
                  "subtitle",
                  style: Theme.of(context).textTheme.headline2.copyWith(
                        color: AppTheme2.primaryColor16,
                        fontSize: SizeConfig.screenWidth / 28,
                      ),
                ),
                // trailing: Icon(
                //   homeController.homeList[index].isSelected
                //       ? Ionicons.checkmark_circle_outline
                //       : Ionicons.radio_button_off_outline,
                //   color: homeController.homeList[index].isSelected
                //       ? AppTheme2.territoryColor
                //       : AppTheme2.primaryColor18,
                // ),
              ),
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
