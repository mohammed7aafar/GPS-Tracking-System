import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/pages/drivers_page.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/pages/settings_page.dart';

import 'core/constants/constants.dart';
import 'features/GpsLvn/presentation/blocs/animatedIconCubit/animatedicon_cubit.dart';
import 'features/GpsLvn/presentation/blocs/devices/devices_bloc.dart';
import 'features/GpsLvn/presentation/blocs/groupIcon/groupicon_cubit.dart';
import 'features/GpsLvn/presentation/blocs/showTrack/showtrack_cubit.dart';
import 'features/GpsLvn/presentation/blocs/splash/splash_bloc.dart';
import 'features/GpsLvn/presentation/blocs/tab/tab_bloc.dart';
import 'features/GpsLvn/presentation/blocs/toggleGeofence/togglegeofence_cubit.dart';
import 'features/GpsLvn/presentation/blocs/toggleRoute/toggleroute_cubit.dart';
import 'features/GpsLvn/presentation/blocs/toggleTrack/toggletrack_cubit.dart';
import 'features/GpsLvn/presentation/blocs/unitGroups/unitgroups_cubit.dart';
import 'features/GpsLvn/presentation/controllers/home_controller.dart';
import 'features/GpsLvn/presentation/pages/home_screen.dart';
import 'features/GpsLvn/presentation/pages/jobs_page.dart';
import 'features/GpsLvn/presentation/pages/splash_screen.dart';
import 'features/GpsLvn/presentation/pages/task_page.dart';
import 'features/GpsLvn/presentation/pages/tools_page.dart';
import 'features/GpsLvn/presentation/pages/units_page.dart';
import 'injection_container.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: DevicePreview.appBuilder,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        //Locale("ar", "AE"),
        Locale("en", "USA"),
      ],
      theme: AppTheme2.themeData(),
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) => MultiBlocProvider(providers: [
              BlocProvider<DevicesBloc>.value(
                  value: sl<DevicesBloc>()
                    ..add(GetDevicesData(token, "en"))),
              BlocProvider<GroupiconCubit>.value(value: sl<GroupiconCubit>()),
              BlocProvider<UnitgroupsCubit>.value(value: sl<UnitgroupsCubit>()),
              BlocProvider.value(value: sl<AnimatediconCubit>()),
              BlocProvider.value(value: sl<TabBloc>()),
              BlocProvider.value(value: sl<ToggletrackCubit>()),
              BlocProvider.value(value: sl<ShowtrackCubit>()),
              BlocProvider.value(value: sl<TogglegeofenceCubit>()),
              BlocProvider.value(value: sl<TogglerouteCubit>()),
            ], child: HomeScreen()),
        '/': (context) => BlocProvider.value(
              value: sl<SplashBloc>()..add(NavigateToHomePage()),
              child: SplashScreen(),
            ),
        'units': (context) => UnitsPage(
              homeController: homeController,
            ),
        'tasks': (context) => TaskPage(homeController: homeController),
        'jobs': (context) => JobsPage(
              homeController: homeController,
            ),

        'drivers': (context) => DriversPage(
              homeController: homeController,
            ),
        'setup': (context) => SettingsPage(),
        'tools': (context) => ToolsPage(),

        // LiveLocationPage.route: (context) => null,
      },
    );
  }
}
