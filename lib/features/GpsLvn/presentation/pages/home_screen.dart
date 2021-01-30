import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/toggleGeofence/togglegeofence_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/toggleRoute/toggleroute_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/toggleTrack/toggletrack_cubit.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../injection_container.dart';
import ' notifications_page.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../theme.dart';
import '../blocs/tab/app_tab.dart';
import '../blocs/tab/tab.dart';
import '../blocs/tab/tab_bloc.dart';
import '../controllers/home_controller.dart';
import '../widgets/bottom_nav_bar.dart';
import 'map_screen.dart';
import 'reports_page.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/animatedIconCubit/animatedicon_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/devices/devices_bloc.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/groupIcon/groupicon_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/map/map_bloc.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/showTrack/showtrack_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/tab/tab_bloc.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/unitGroups/unitgroups_cubit.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = HomeController();

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomeScreen());
  }

// Create storage
final storage = new FlutterSecureStorage();

  // GoogleMapController _controller;

  // CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -100.085749655962),
  //   zoom: 15.4746,
  // );

  // CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  //setMapStyle(String mapStyle) => _controller.setMapStyle(mapStyle);

  // Future<String> getJsonFile(String path) async =>
  //     await rootBundle.loadString(path);

  //changeMapMode() => getJsonFile("assets/map_theme.json").then(setMapStyle);

  // final HideNavbar hiding = HideNavbar();
  
 


  Future<String> hasToken() async {
     return await storage.read(key: "token"); 

  }

  @override
  Widget build(BuildContext context) {
    
    final token = hasToken();
  
    return  MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => sl<DevicesBloc>()..add(GetDevicesData(token.toString(), "en"))),
              BlocProvider(create: (context) => FlutterMapBloc( devicesBloc: BlocProvider.of<DevicesBloc>(context),)),
              BlocProvider(create: (context) => sl<GroupiconCubit>()),
              BlocProvider(create: (context) => sl<UnitgroupsCubit>()),
              BlocProvider(create: (context) => sl<AnimatediconCubit>()),  
              BlocProvider(create: (context) => sl<TabBloc>()),
              BlocProvider(create: (context) => sl<ToggletrackCubit>()),
              BlocProvider(create: (context) => sl<ShowtrackCubit>()),
              BlocProvider(create: (context) => sl<TogglegeofenceCubit>()),
              BlocProvider(create: (context) => sl<TogglerouteCubit>()),
            ],
            child: 
      
    
    HomePage(homeController: homeController));
  }

  
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    @required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: homeController.drawerKey,
        backgroundColor: AppTheme2.primaryColor,
        body: BlocBuilder<TabBloc, AppTab>(builder: (context, activeTab) {
              return selectPageTab(activeTab);
            }),
        bottomNavigationBar:
            BlocBuilder<TabBloc, AppTab>(builder: (context, activeTab) {
          return BottomNavigationBarWidget(
            activeTab: activeTab,
            //! (tab) => value of appTab
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(TabUpdated(tab)),
          );
        }),
        drawer: DrawerItemsWidget(
          homeController: homeController,
     ) );
  }

  selectPageTab(activeTab) {
    switch (activeTab) {
      case AppTab.map:
        return MapTabPage(
          homeController: homeController,
        );
        break;
      case AppTab.reports:
        return ReportsPage();
        break;

      // case AppTab.track:
      //   return MapTabPage(
      //     homeController: homeController,
      //   );
      //   break;
      case AppTab.notifications:
        return NotificationsPage(homeController: homeController);
        break;

      default:
        return Container();
    }
  }
}

class DrawerItemsWidget extends StatelessWidget {
  const DrawerItemsWidget({
    Key key,
    this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: AppTheme2.primaryColor,
      child: ListView(
        children: [
          Material(
              color: AppTheme2.primaryColor,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/tools');
                },
                leading: Icon(
                  Ionicons.person_circle_outline,
                  color: AppTheme2.primaryColor18,
                  size: 60,
                ),
                title: Text(
                  "Admin",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: AppTheme2.primaryColor18,
                        fontSize: SizeConfig.screenWidth / 25,
                      ),
                ),
                subtitle: Text(
                  "Admin@gmail.com",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: AppTheme2.primaryColor13,
                        fontSize: SizeConfig.screenWidth / 25,
                      ),
                ),
                trailing: Icon(
                  Ionicons.chevron_forward_outline,
                  color: AppTheme2.primaryColor18,
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: AppTheme2.primaryColor13,
            height: 3,
          ),
          SizedBox(
            height: 20,
          ),
          Material(
              color: AppTheme2.primaryColor,
              child: ListTile(
                onTap: () {
                  context.read<ToggletrackCubit>().toggleTrackTabFromMapTab();
                  Navigator.of(context).pushNamed('/units');
                },
                leading: Icon(
                  Ionicons.car_outline,
                  color: AppTheme2.primaryColor18,
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Units",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: AppTheme2.primaryColor18,
                          fontSize: SizeConfig.screenWidth / 25,
                        ),
                  ),
                ),
                trailing: Icon(
                  Ionicons.chevron_forward_outline,
                  color: AppTheme2.primaryColor18,
                ),
              )),
          Material(
              color: AppTheme2.primaryColor,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/tasks');
                },
                leading: Icon(
                  Ionicons.build_outline,
                  color: AppTheme2.primaryColor18,
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Tasks",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: AppTheme2.primaryColor18,
                          fontSize: SizeConfig.screenWidth / 25,
                        ),
                  ),
                ),
                trailing: Icon(
                  Ionicons.chevron_forward_outline,
                  color: AppTheme2.primaryColor18,
                ),
              )),
          Material(
              color: AppTheme2.primaryColor,
              child: ListTile(
                onTap: () {
                  context.read<TogglerouteCubit>().toggleRouteFromMapTab();
                  Navigator.pop(context);
                  context.read<TogglegeofenceCubit>().toggleGeofence();
                },
                leading: Icon(
                  Ionicons.locate_outline,
                  color: AppTheme2.primaryColor18,
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Geofences",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: AppTheme2.primaryColor18,
                          fontSize: SizeConfig.screenWidth / 25,
                        ),
                  ),
                ),
                trailing: Icon(
                  Ionicons.chevron_forward_outline,
                  color: AppTheme2.primaryColor18,
                ),
              )),
          Material(
              color: AppTheme2.primaryColor,
              child: ListTile(
                onTap: () {
                  context.read<ToggletrackCubit>().toggleTrackTabFromMapTab();
                  context
                      .read<TogglegeofenceCubit>()
                      .toggleGeofenceFromMapTab();
                  Navigator.of(context).pop();
                  context.read<TogglerouteCubit>().toggleRoute();
                },
                leading: Icon(
                  Ionicons.navigate_outline,
                  color: AppTheme2.primaryColor18,
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Routes",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: AppTheme2.primaryColor18,
                          fontSize: SizeConfig.screenWidth / 25,
                        ),
                  ),
                ),
                trailing: Icon(
                  Ionicons.chevron_forward_outline,
                  color: AppTheme2.primaryColor18,
                ),
              )),
          Material(
              color: AppTheme2.primaryColor,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/jobs');
                },
                leading: Icon(
                  Ionicons.clipboard_outline,
                  color: AppTheme2.primaryColor18,
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Jobs",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: AppTheme2.primaryColor18,
                          fontSize: SizeConfig.screenWidth / 25,
                        ),
                  ),
                ),
                trailing: Icon(
                  Ionicons.chevron_forward_outline,
                  color: AppTheme2.primaryColor18,
                ),
              )),
          Material(
              color: AppTheme2.primaryColor,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/drivers');
                },
                leading: Icon(
                  Ionicons.speedometer_outline,
                  color: AppTheme2.primaryColor18,
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Drivers",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: AppTheme2.primaryColor18,
                          fontSize: SizeConfig.screenWidth / 25,
                        ),
                  ),
                ),
                trailing: Icon(
                  Ionicons.chevron_forward_outline,
                  color: AppTheme2.primaryColor18,
                ),
              )),
          Material(
              color: AppTheme2.primaryColor,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/setup');
                },
                leading: Icon(
                  Ionicons.settings_outline,
                  color: AppTheme2.primaryColor18,
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Setup",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: AppTheme2.primaryColor18,
                          fontSize: SizeConfig.screenWidth / 25,
                        ),
                  ),
                ),
                trailing: Icon(
                  Ionicons.chevron_forward_outline,
                  color: AppTheme2.primaryColor18,
                ),
              )),
          SizedBox(
            height: 120,
          ),
          Row(
            children: [
              Expanded(
                child: Icon(
                  Ionicons.logo_facebook,
                  color: AppTheme2.primaryColor18,
                ),
              ),
              Expanded(
                child: Icon(
                  Ionicons.logo_whatsapp,
                  color: AppTheme2.primaryColor18,
                ),
              ),
              Expanded(
                child: Icon(
                  Ionicons.logo_twitter,
                  color: AppTheme2.primaryColor18,
                ),
              ),
              Expanded(
                child: Icon(
                  Ionicons.logo_instagram,
                  color: AppTheme2.primaryColor18,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
                child: Text("Powered by GPS LVN",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        fontSize: SizeConfig.screenWidth / 25,
                        color: AppTheme2.primaryColor18))),
          )
        ],
      ),
    ));
  }
}

class RoutesWidget extends StatelessWidget {
  const RoutesWidget({
    Key key,
    @required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppTheme2.primaryColor,
        padding: const EdgeInsets.all(0),
        width: double.infinity,
        height: SizeConfig.screenHeight,
        child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
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
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: SizeConfig.screenWidth / 30,
                                    color: AppTheme2.whiteColor),
                            decoration: InputDecoration(
                                hintText: "Route name",
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
                    Material(
                        borderRadius: BorderRadius.circular(8),
                        color: AppTheme2.primaryColor20,
                        child: InkWell(
                            borderRadius: BorderRadius.circular(8.0),
                            // onTap: () => buildChooseColorBottomSheet(context),
                            child: Container(
                                height: SizeConfig.screenWidth / 8,
                                width: double.infinity,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "Choose Color",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                          fontSize: SizeConfig.screenWidth / 25,
                                          color: AppTheme2.primaryColor18),
                                )))),
                  ])),
              Row(
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
                    "        Routes",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: AppTheme2.primaryColor18,
                          fontSize: SizeConfig.screenWidth / 23,
                        ),
                  ),
                  Text(
                    "Add   ",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: AppTheme2.territoryColor,
                          fontSize: SizeConfig.screenWidth / 23,
                        ),
                  ),
                ],
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
                      Ionicons.navigate_outline,
                      color: AppTheme2.primaryColor18,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Routes",
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
              for (int i = 0; i < 3; i++)
                Row(
                  children: [
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
                      "Route Name",
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
                                  onPressed: () {}
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
            ])));
  }
}
