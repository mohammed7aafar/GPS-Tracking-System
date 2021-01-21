import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/pages/drivers_page.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/pages/settings_page.dart';
import 'features/GpsLvn/presentation/blocs/animatedIconCubit/animatedicon_cubit.dart';
import 'features/GpsLvn/presentation/blocs/devices/devices_bloc.dart';
import 'features/GpsLvn/presentation/blocs/groupIcon/groupicon_cubit.dart';
import 'features/GpsLvn/presentation/blocs/map/map_bloc.dart';
import 'features/GpsLvn/presentation/blocs/showTrack/showtrack_cubit.dart';
import 'features/GpsLvn/presentation/blocs/splash/splash_bloc.dart';
import 'features/GpsLvn/presentation/blocs/tab/tab_bloc.dart';
import 'features/GpsLvn/presentation/blocs/toggleGeofence/togglegeofence_cubit.dart';
import 'features/GpsLvn/presentation/blocs/toggleRoute/toggleroute_cubit.dart';
import 'features/GpsLvn/presentation/blocs/toggleTrack/toggletrack_cubit.dart';
import 'features/GpsLvn/presentation/blocs/unitGroups/unitgroups_cubit.dart';
import 'features/GpsLvn/presentation/pages/home_screen.dart';
import 'features/GpsLvn/presentation/pages/jobs_page.dart';
import 'features/GpsLvn/presentation/pages/splash_screen.dart';
import 'features/GpsLvn/presentation/pages/task_page.dart';
import 'features/GpsLvn/presentation/pages/tools_page.dart';
import 'features/GpsLvn/presentation/pages/units_page.dart';
import 'injection_container.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
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
        'home': (context) => MultiBlocProvider(
                providers: [
                  BlocProvider<GroupiconCubit>(
                      create: (context) => sl<GroupiconCubit>()),
                  BlocProvider<UnitgroupsCubit>(
                      create: (context) => sl<UnitgroupsCubit>()),
                  BlocProvider<AnimatediconCubit>(
                      create: (context) => sl<AnimatediconCubit>()),
                  BlocProvider<TabBloc>(create: (context) => sl<TabBloc>()),
                  BlocProvider<ToggletrackCubit>(
                      create: (context) => sl<ToggletrackCubit>()),
                  BlocProvider<ShowtrackCubit>(
                      create: (context) => sl<ShowtrackCubit>()),
                  BlocProvider<TogglegeofenceCubit>(
                      create: (context) => sl<TogglegeofenceCubit>()),
                  BlocProvider<TogglerouteCubit>(
                      create: (context) => sl<TogglerouteCubit>()),
                  BlocProvider<FlutterMapBloc>(
                      create: (context) => FlutterMapBloc(
                            devicesBloc: BlocProvider.of<DevicesBloc>(context),
                          )),
                ],
                // child: bloc.BlocProvider(
                //     bloc: MapBloc(
                //       devicesBloc: BlocProvider.of<DevicesBloc>(context),
                //     ),
                child: HomeScreen()),
        '/': (context) => BlocProvider.value(
              value: SplashBloc(
                devicesBloc: BlocProvider.of<DevicesBloc>(context),
              ),
              child: SplashScreen(),
            ),
        'units': (context) => UnitsPage(),
        'tasks': (context) => TaskPage(),
        'jobs': (context) => JobsPage(),
        'drivers': (context) => DriversPage(),
        'setup': (context) => SettingsPage(),
        'tools': (context) => ToolsPage(),

        // LiveLocationPage.route: (context) => null,
      },
    );
  }
}
