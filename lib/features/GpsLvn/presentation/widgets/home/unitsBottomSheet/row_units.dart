import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../../core/utils/api_refrence.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../theme.dart';
import '../../../../domain/entities/devices.dart' as devices;
import '../../../blocs/map/map_bloc.dart';
import 'footer_expanded_unit_children.dart';
import 'header_expanded_units_children.dart';

class RowUnitsWidget extends StatelessWidget {
  const RowUnitsWidget({
    Key key,
    @required this.item,
    this.gestureTapCallback,
  }) : super(key: key);

  final devices.Item item;
  final Function(LatLng latLng) gestureTapCallback;

  //  _onChange(LatLng latLng) {
  //   gestureTapCallback(latLng);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme2.primaryColor20,
      child: Column(
        children: [
          ListTile(
            onTap: () => gestureTapCallback(LatLng(item.lat, item.lng)),
            contentPadding: const EdgeInsets.all(0.0),
            title: Row(
              children: [
                Flexible(
                  child: Checkbox(
                    value: item.deviceData.checked == "0" ? false : true,
                    onChanged: (bool value) {
                      BlocProvider.of<FlutterMapBloc>(context).add(ItemsUpdated(
                          item.copyWith(
                              deviceData: item.deviceData.copyWith(
                                  checked: item.deviceData.checked == "0"
                                      ? "1"
                                      : "0"))));
                    },
                    //tristate: ,
                    activeColor: AppTheme2.primaryColor18,
                    checkColor: AppTheme2.primaryColor20,
                  ),
                ),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: "${ApiRefrence.publicDomain}${item.icon.path}",
                    fit: BoxFit.contain,
                    height: 24,
                    width: 24,
                    // placeholder: (context, url) => Container(color: Theme.of(context).focusColor,),
                    // errorWidget: (context, url, error) => Image.asset("assets/car2.png",height: 24,
                    //  width: 24,),
                  ),
                )),
                Flexible(
                    child: FractionallySizedBox(
                  widthFactor: 1.1,
                  child: Text(
                    "${item.name}",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: SizeConfig.screenWidth / 35,
                        color: AppTheme2.primaryColor18),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
                Flexible(
                    child: FractionallySizedBox(
                  widthFactor: 1.5,
                  child: Text(
                    "",
                  ),
                )),
                Flexible(
                    child: Container(
                  padding: const EdgeInsets.all(8.0),
                )),
                Flexible(
                    child: ClipOval(
                        child: Material(
                            color: AppTheme2.primaryColor20,
                            child: IconButton(
                                highlightColor: AppTheme2.primaryColor21,
                                icon: const Icon(
                                  Ionicons.chevron_down_outline,
                                  color: AppTheme2.primaryColor18,
                                  // size: SizeConfig.screenWidth / 25,
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                      backgroundColor: AppTheme2.primaryColor20,
                                      context: context,
                                      builder: (context) {
                                        return SingleChildScrollView(
                                          child: Wrap(
                                            spacing: 10.0,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Center(
                                                child: Container(
                                                  height: 5.5,
                                                  width: 45,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      color: AppTheme2
                                                          .primaryColor22),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Center(
                                                  child: Text("Unit details",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5
                                                          .copyWith(
                                                            color: AppTheme2
                                                                .primaryColor18,
                                                            fontSize: SizeConfig
                                                                    .screenWidth /
                                                                23,
                                                          ))),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              UnitNameRowHeaderDetails(
                                                  item: item),
                                              const UnitRowHeaderDetails(),
                                              const UnitFooterDetails()
                                            ],
                                          ),
                                        ); //whatever you're returning, does not have to be a Container
                                      });
                                })))),
                Flexible(
                  child: ClipOval(
                      child: Material(
                          color: AppTheme2.primaryColor20,
                          child: IconButton(
                              highlightColor: AppTheme2.primaryColor21,
                              icon: const Icon(
                                Ionicons.remove_circle_outline,
                                color: AppTheme2.primaryColor18,
                                // size: SizeConfig.screenWidth / 25,
                              ),
                              onPressed: null))),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/satalite2.png",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                Flexible(
                  child: ClipOval(
                      child: Material(
                          color: AppTheme2.primaryColor20,
                          child: IconButton(
                              highlightColor: AppTheme2.primaryColor21,
                              icon: const Icon(
                                Ionicons.ellipse,
                                color: AppTheme2.onlineColor,
                                // size: SizeConfig.screenWidth / 25,
                              ),
                              onPressed: null))),
                ),
                Flexible(
                  child: ClipOval(
                      child: Material(
                          color: AppTheme2.primaryColor20,
                          child: IconButton(
                            highlightColor: AppTheme2.primaryColor21,
                            icon: const Icon(
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
          Divider(
            color: AppTheme2.clearColor,
            height: 2,
          ),
        ],
      ),
    );
  }
}

class UnitNameRowHeaderDetails extends StatelessWidget {
  const UnitNameRowHeaderDetails({
    Key key,
    @required this.item,
  }) : super(key: key);

  final devices.Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: ClipOval(
              child: Material(
                  color: AppTheme2.primaryColor20,
                  child: IconButton(
                    highlightColor: AppTheme2.primaryColor21,
                    icon: const Icon(
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
           flex: 9,
          child:
        Text("${item.name}",
            style: Theme.of(context).textTheme.headline5.copyWith(
                  color: AppTheme2.primaryColor18,
                  fontSize: SizeConfig.screenWidth / 23,
         ))),
      ],
    );
  }
}
