import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/animatedIconCubit/animatedicon_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/devices/devices_bloc.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/groupIcon/groupicon_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/map/map_bloc.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/showTrack/showtrack_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/tab/tab_bloc.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/toggleGeofence/togglegeofence_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/toggleRoute/toggleroute_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/toggleTrack/toggletrack_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/unitGroups/unitgroups_cubit.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../injection_container.dart';
import '../../../../theme.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
        backgroundColor: AppTheme2.primaryColor,
        body: Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Container(
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
                      prefixIcon: Icon(
                        Ionicons.person_outline,
                        color: AppTheme2.primaryColor18,
                      ),
                      hintText: "UserName",
                      hintStyle: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: SizeConfig.screenWidth / 30,
                          color: AppTheme2.primaryColor18),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
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
                      prefixIcon: Icon(
                        Ionicons.key_outline,
                        color: AppTheme2.primaryColor18,
                      ),
                      hintText: "Password",
                      hintStyle: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: SizeConfig.screenWidth / 30,
                          color: AppTheme2.primaryColor18),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme2.primaryColor20,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () => buildBottomSheet(context),
                      child: Container(
                          height: SizeConfig.screenWidth / 8,
                          padding: EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Ionicons.server_outline,
                                    color: AppTheme2.primaryColor18,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                            fontSize:
                                                SizeConfig.screenWidth / 30,
                                            color: AppTheme2.primaryColor18),
                                  ),
                                ],
                              ),
                              IconButton(
                                  padding: EdgeInsets.symmetric(vertical: 1),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: SizeConfig.screenWidth / 15,
                                    color: AppTheme2.primaryColor18,
                                  ),
                                  onPressed: () {
                                    buildBottomSheet(context);
                                  })
                            ],
                          )))),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (bool value) {
                      //loginController.rememberMe(value);
                    },
                    activeColor: AppTheme2.territoryColor,
                    checkColor: AppTheme2.primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Remember me",
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        fontSize: SizeConfig.screenWidth / 30,
                        color: AppTheme2.primaryColor18),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme2.primaryColor20,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (_) => MultiBlocProvider(
                        //           providers: [
                        //             BlocProvider.value(
                        //                 value: sl<DevicesBloc>()),
                        //             BlocProvider(
                        //                 create: (context) => FlutterMapBloc(
                        //                       devicesBloc:
                        //                           BlocProvider.of<DevicesBloc>(
                        //                               context),
                        //                     )),
                        //             BlocProvider(
                        //                 create: (context) =>
                        //                     sl<GroupiconCubit>()),
                        //             BlocProvider(
                        //                 create: (context) =>
                        //                     sl<UnitgroupsCubit>()),
                        //             BlocProvider(
                        //                 create: (context) =>
                        //                     sl<AnimatediconCubit>()),
                        //             BlocProvider(
                        //                 create: (context) => sl<TabBloc>()),
                        //             BlocProvider(
                        //                 create: (context) =>
                        //                     sl<ToggletrackCubit>()),
                        //             BlocProvider(
                        //                 create: (context) =>
                        //                     sl<ShowtrackCubit>()),
                        //             BlocProvider(
                        //                 create: (context) =>
                        //                     sl<TogglegeofenceCubit>()),
                        //             BlocProvider(
                        //                 create: (context) =>
                        //                     sl<TogglerouteCubit>()),
                        //           ],
                        //           child: TestWidgetBloc()
                                  
                        //           //HomeScreen(),
                        //         ))
                        //         );
                      },
                      child: Container(
                          height: SizeConfig.screenWidth / 7,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Log in",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                      fontSize: SizeConfig.screenWidth / 22,
                                      color: AppTheme2.primaryColor18),
                          )))),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text("Forgot Password?",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontSize: SizeConfig.screenWidth / 25,
                          color: AppTheme2.territoryColor,
                        )),
              ),
              Spacer(),
              Container(
                  child: Text("Powered by GPS LVN",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          fontSize: SizeConfig.screenWidth / 25,
                          color: AppTheme2.primaryColor18)))
            ],
          ),
        ));
  }

  Future buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppTheme2.primaryColor,
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppTheme2.primaryColor11),
                        ),
                      )),
                  Material(
                      borderOnForeground: true,
                      borderRadius: BorderRadius.circular(8),
                      color: AppTheme2.primaryColor,
                      child: ListTile(
                        title: Text("Europe",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(
                                    fontSize: SizeConfig.screenWidth / 25,
                                    color: AppTheme2.primaryColor18)),
                        onTap: () {},
                        // loginController.selectTrackingServer("Europe"),
                      )),
                  Material(
                      borderOnForeground: true,
                      borderRadius: BorderRadius.circular(8),
                      color: AppTheme2.primaryColor,
                      child: ListTile(
                        title: Text("Asia",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(
                                    color: AppTheme2.primaryColor18,
                                    fontSize: SizeConfig.screenWidth / 25)),
                        onTap: () {},
                        //loginController.selectTrackingServer("Asia"),
                      )),
                  Material(
                      borderOnForeground: true,
                      borderRadius: BorderRadius.circular(8),
                      color: AppTheme2.primaryColor,
                      child: ListTile(
                        title: Text("USA",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(
                                    color: AppTheme2.primaryColor18,
                                    fontSize: SizeConfig.screenWidth / 25)),
                        onTap: () {},
                        // loginController.selectTrackingServer("USA"),
                      )),
                  Material(
                      borderOnForeground: true,
                      borderRadius: BorderRadius.circular(8),
                      color: AppTheme2.primaryColor,
                      child: ListTile(
                          title: Text("Custom",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                      color: AppTheme2.primaryColor18,
                                      fontSize: SizeConfig.screenWidth / 25)),
                          onTap: () => buildGetDefaultDialog(context))),
                ],
              ));
        });
  }

  buildGetDefaultDialog(context) {
    //  return
    // Get.defaultDialog(
    //   title: "Enter Server",
    //   content: Container(
    //     height: SizeConfig.screenWidth / 9,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(8),
    //       color: AppTheme2.primaryColor11,
    //     ),
    //     child: TextFormField(
    //       style: Theme.of(context).textTheme.headline5.copyWith(
    //           fontSize: SizeConfig.screenWidth / 22,
    //           color: AppTheme2.whiteColor),
    //       decoration: InputDecoration(
    //           border: InputBorder.none,
    //           contentPadding: const EdgeInsets.all(10)),
    //       cursorColor: AppTheme2.territoryColor,
    //     ),
    //   ),
    //   backgroundColor: AppTheme2.primaryColor,
    //   titleStyle: Theme.of(context)
    //       .textTheme
    //       .headline6
    //       .copyWith(fontSize: SizeConfig.screenWidth / 23),
    //   confirm: Text(
    //     "OK",
    //     style: Theme.of(context).textTheme.button.copyWith(
    //         fontSize: SizeConfig.screenWidth / 23,
    //         color: AppTheme2.territoryColor),
    //   ),
    // );
  }
}


class TestWidgetBloc extends StatelessWidget {
  const TestWidgetBloc({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<FlutterMapBloc, MapState>(
        builder: (context, state) {
          if(state is ItemsLoadInProgress){
            return Text("loading");
          }
            else{
              return Text("loaded");
            }
          }
        
      )
    );
  }
}