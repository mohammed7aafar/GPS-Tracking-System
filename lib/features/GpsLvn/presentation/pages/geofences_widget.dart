import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/groupIcon/groupicon_cubit.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../theme.dart';


class GeoFencesWidget extends StatelessWidget {
  const GeoFencesWidget({
    Key key,
  }) : super(key: key);

  static final bool isShowed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppTheme2.primaryColor,
        padding: const EdgeInsets.all(0),
        width: double.infinity,
        height: SizeConfig.screenHeight,
        child: SingleChildScrollView(
            //physics: NeverScrollableScrollPhysics(),
            child: Column(children: [
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
          GeoFencesDetailsWidget(),
          //: Container(),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: AppTheme2.territoryColor,
                        fontSize: SizeConfig.screenWidth / 23,
                      ),
                ),
                Text(
                  "  Geofences",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: AppTheme2.primaryColor18,
                        fontSize: SizeConfig.screenWidth / 23,
                      ),
                ),
                InkWell(
                    onTap: () {
                      // homeController.showGeofenceDetails();
                    },
                    child: Text(
                      "Add",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: AppTheme2.territoryColor,
                            fontSize: SizeConfig.screenWidth / 23,
                          ),
                    )),
                //: Container())),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: AppTheme2.clearColor,
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Ionicons.locate_outline,
                  color: AppTheme2.primaryColor18,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Geofences",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: AppTheme2.primaryColor18,
                        fontSize: SizeConfig.screenWidth / 23,
                      ),
                ),
                Spacer(),
                ClipOval(
                  child: Material(
                      color: AppTheme2.primaryColor,
                      child: IconButton(
                        highlightColor: AppTheme2.primaryColor21,
                        icon: Icon(
                          Ionicons.close_outline,
                          color: AppTheme2.errorColor,
                          // size: SizeConfig.screenWidth / 25,
                        ),
                        onPressed: () {
                          print("hi");
                        },
                      )),
                ),
              ],
            ),
          ),
          Divider(
            color: AppTheme2.clearColor,
            height: 3,
          ),
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
              Text(
                "Group",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: AppTheme2.primaryColor18,
                      fontSize: SizeConfig.screenWidth / 25,
                    ),
              ),
              Spacer(
                flex: 3,
              ),
              Flexible(
                child: ClipOval(
                    child: Material(
                        color: AppTheme2.primaryColor,
                        child: IconButton(
                            highlightColor: AppTheme2.primaryColor21,
                            icon: Icon(
                              Ionicons.cog_outline,
                              color: AppTheme2.primaryColor18,
                              // size: SizeConfig.screenWidth / 25,
                            ),
                            onPressed: () {
                              showBottomSheet(
                                context: context,
                                builder: (context) {
                                  final theme = Theme.of(context);
                                  // Using Wrap makes the bottom sheet height the height of the content.
                                  // Otherwise, the height will be half the height of the screen.
                                  return Wrap(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.only(
                                            left: 20.0,
                                            right: 20.0,
                                            bottom: 20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppTheme2.primaryColor,
                                        ),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Center(
                                                  child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0, bottom: 10.0),
                                                child: Container(
                                                  height: 5.5,
                                                  width: 45,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      color: AppTheme2
                                                          .primaryColor11),
                                                ),
                                              )),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  // Obx(
                                                  //   () => homeController
                                                  //           .saved.isNotEmpty
                                                  //       ?
                                                  Text(
                                                    "Cancel",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5
                                                        .copyWith(
                                                          color: AppTheme2
                                                              .territoryColor,
                                                          fontSize: SizeConfig
                                                                  .screenWidth /
                                                              25,
                                                        ),
                                                  ),

                                                  Text(
                                                    "Group Name",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5
                                                        .copyWith(
                                                          color: AppTheme2
                                                              .primaryColor18,
                                                          fontSize: SizeConfig
                                                                  .screenWidth /
                                                              23,
                                                        ),
                                                  ),
                                                  // Obx(
                                                  //   () => homeController
                                                  //           .saved.isNotEmpty
                                                  //       ?

                                                  Text(
                                                    "Add",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5
                                                        .copyWith(
                                                          color: AppTheme2
                                                              .territoryColor,
                                                          fontSize: SizeConfig
                                                                  .screenWidth /
                                                              25,
                                                        ),
                                                  )
                                                  // : Container(),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              Material(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color:
                                                      AppTheme2.primaryColor20,
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    onTap: () {},
                                                    child: Container(
                                                        height: SizeConfig
                                                                .screenWidth /
                                                            8,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          // color: AppTheme2.primaryColor20,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Ionicons
                                                                  .search_outline,
                                                              color: AppTheme2
                                                                  .primaryColor18,
                                                            ),
                                                            SizedBox(
                                                              width: 13,
                                                            ),
                                                            Text(
                                                              "Search",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline6
                                                                  .copyWith(
                                                                      fontSize:
                                                                          SizeConfig.screenWidth /
                                                                              30,
                                                                      color: AppTheme2
                                                                          .primaryColor18),
                                                            )
                                                          ],
                                                        )),
                                                  )),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              for (int index = 0;
                                                  index < 3;
                                                  index++) ...[
                                                Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: AppTheme2
                                                        .primaryColor20,
                                                    child: ListTile(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      onTap: () => {},
                                                      leading: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Image.asset(
                                                          "assets/car.png",
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                      title: Text(
                                                        "GeoFence Name",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6
                                                            .copyWith(
                                                              color: AppTheme2
                                                                  .primaryColor18,
                                                              fontSize: SizeConfig
                                                                      .screenWidth /
                                                                  25,
                                                            ),
                                                      ),
                                                      trailing: Icon(
                                                        // homeController
                                                        //         .homeList[
                                                        //             index]
                                                        //         .isSelected
                                                        //?
                                                        Ionicons
                                                            .checkmark_circle_outline,
                                                        // : Ionicons
                                                        //     .radio_button_off_outline,
                                                        color:
                                                            //  homeController
                                                            //         .homeList[
                                                            //             index]
                                                            //         .isSelected
                                                            //     ? AppTheme2
                                                            //         .territoryColor
                                                            //     :
                                                            AppTheme2
                                                                .primaryColor18,
                                                      ),
                                                    )),
                                                SizedBox(
                                                  height: 10,
                                                )
                                              ]
                                            ]),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }

                            // showBottomSheet(
                            //     context: context,

                            //     builder: (context) {
                            //       return addUnitsToViewBottomSheet(context);
                            //     }),
                            //  showCupertinoModalBottomSheet(
                            //   expand: true,
                            //   bounce: true,
                            //   context: context,
                            //   backgroundColor: AppTheme2.primaryColor,
                            //   builder: (context) =>
                            //       viewGroupdetailsBottomSheet(context),
                            // ),
                            ))),
              ),
              Flexible(
                child: ClipOval(
                    child: Material(
                        color: AppTheme2.primaryColor,
                        child: IconButton(
                          highlightColor: AppTheme2.primaryColor21,
                          icon: Icon(
                            Ionicons.close_outline,
                            color: AppTheme2.errorColor,
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
            if (!state)
              return Container();
            else
              return Column(
                children: [
                  for (int i = 0; i < 3; i++)
                    Row(
                      children: [
                        // Spacer(
                        //   flex: 1,
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
                        Text(
                          "GeoFence",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: AppTheme2.primaryColor18,
                                fontSize: SizeConfig.screenWidth / 25,
                              ),
                        ),

                        SizedBox(
                          width: 22,
                        ),
                        Spacer(
                          flex: 3,
                        ),
                        Flexible(
                          child: ClipOval(
                              child: Material(
                                  color: AppTheme2.primaryColor,
                                  child: IconButton(
                                    highlightColor: AppTheme2.primaryColor21,
                                    icon: Icon(
                                      Ionicons.cog_outline,
                                      color: AppTheme2.primaryColor18,
                                      // size: SizeConfig.screenWidth / 25,
                                    ),
                                    onPressed: () {},

                                    //  showCupertinoModalBottomSheet(
                                    //   expand: true,
                                    //   bounce: true,
                                    //   context: context,
                                    //   backgroundColor: AppTheme2.primaryColor,
                                    //   builder: (context) =>
                                    //       viewGroupdetailsBottomSheet(context),
                                    // ),
                                  ))),
                        ),
                        Flexible(
                          child: ClipOval(
                              child: Material(
                                  color: AppTheme2.primaryColor,
                                  child: IconButton(
                                    highlightColor: AppTheme2.primaryColor21,
                                    icon: Icon(
                                      Ionicons.close_outline,
                                      color: AppTheme2.errorColor,
                                      // size: SizeConfig.screenWidth / 25,
                                    ),
                                    onPressed: () {
                                      print("hi");
                                    },
                                  ))),
                        ),
                      ],
                    ),
                ],
              );
          }),
        ])));
  }

  // Widget addUnitsToViewBottomSheet(context) {
  //   return SingleChildScrollView(
  //     child:
  //   );
  // }
}

class GeoFencesDetailsWidget extends StatelessWidget {
  const GeoFencesDetailsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  // homeController.showGeofenceDetails();
                },
                child: Text(
                  "Cancel",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: AppTheme2.territoryColor,
                        fontSize: SizeConfig.screenWidth / 25,
                      ),
                )),
            Text(
              "",
              style: Theme.of(context).textTheme.headline5.copyWith(
                    color: AppTheme2.primaryColor18,
                    fontSize: SizeConfig.screenWidth / 23,
                  ),
            ),
            InkWell(
                onTap: () {
                  // homeController.showGeofenceDetails();
                },
                child: Text(
                  "save",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: AppTheme2.territoryColor,
                        fontSize: SizeConfig.screenWidth / 25,
                      ),
                ))
          ],
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Material(
                borderRadius: BorderRadius.circular(8),
                color: AppTheme2.primaryColor20,
                child: Container(
                  height: SizeConfig.screenWidth / 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme2.primaryColor20,
                  ),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: SizeConfig.screenWidth / 30,
                        color: AppTheme2.whiteColor),
                    decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(
                                fontSize: SizeConfig.screenWidth / 30,
                                color: AppTheme2.primaryColor18),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15)),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: Material(
                      borderRadius: BorderRadius.circular(8),
                      color: AppTheme2.primaryColor20,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                            height: SizeConfig.screenWidth / 8,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Obx(
                                //   () =>
                                Text(
                                  "group",
                                  //loginController.hostServerName.value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                          fontSize: SizeConfig.screenWidth / 30,
                                          color: AppTheme2.primaryColor18),
                                ),
                                //),
                                IconButton(
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      size: SizeConfig.screenWidth / 15,
                                      color: AppTheme2.primaryColor18,
                                    ),
                                    onPressed: () {})
                              ],
                            )),
                      )),
                ),
                ClipOval(
                  child: Material(
                      borderRadius: BorderRadius.circular(8),
                      color: AppTheme2.primaryColor,
                      child: IconButton(
                          highlightColor: AppTheme2.primaryColor21,
                          padding: EdgeInsets.symmetric(vertical: 0),
                          icon: Icon(
                            Icons.add,
                            size: SizeConfig.screenWidth / 15,
                            color: AppTheme2.primaryColor18,
                          ),
                          onPressed: () {})),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Material(
                borderRadius: BorderRadius.circular(8),
                color: AppTheme2.primaryColor20,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                      height: SizeConfig.screenWidth / 8,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Obx(
                          //   () =>
                          Text(
                            "Type",
                            //loginController.hostServerName.value,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: SizeConfig.screenWidth / 30,
                                    color: AppTheme2.primaryColor18),
                          ),
                          //),
                          IconButton(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              icon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                size: SizeConfig.screenWidth / 15,
                                color: AppTheme2.primaryColor18,
                              ),
                              onPressed: () {})
                        ],
                      )),
                )),
            SizedBox(
              height: 20,
            ),
            Material(
                borderRadius: BorderRadius.circular(8),
                color: AppTheme2.primaryColor20,
                child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () => buildChooseColorBottomSheet(context),
                    child: Container(
                        height: SizeConfig.screenWidth / 8,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Choose Color",
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              fontSize: SizeConfig.screenWidth / 25,
                              color: AppTheme2.primaryColor18),
                        )))),
          ])),
    ]);
  }

  void buildChooseColorBottomSheet(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.purpleAccent,
      Colors.blue,
      Colors.blueAccent,
      Colors.lightBlue,
      Colors.lightBlueAccent,
      Colors.greenAccent,
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.purpleAccent,
      Colors.blue,
      Colors.blueAccent,
      Colors.lightBlue,
      Colors.lightBlueAccent,
      Colors.greenAccent,
    ];

    showModalBottomSheet<void>(
        context: context,
        barrierColor: Colors.transparent,
        enableDrag: true,
        builder: (BuildContext context) {
          return Container(
              color: AppTheme2.primaryColor,
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 20,
                padding: const EdgeInsets.all(8.0),
                children: <Widget>[
                  for (int i = 0; i < colors.length; i++)
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: colors[i]),
                    ),
                ],
              ));
        });
  }
}
