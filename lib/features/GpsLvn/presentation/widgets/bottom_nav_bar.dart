import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/toggleGeofence/togglegeofence_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/toggleMap/togglemap_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/toggleRoute/toggleroute_cubit.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/toggleTrack/toggletrack_cubit.dart';
import '../blocs/tab/app_tab.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/utils/size_config.dart';
class BottomNavigationBarWidget extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;
  const BottomNavigationBarWidget({
    Key key,
    this.activeTab,
    this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: AppTab.values.indexOf(activeTab),
        onTap: (index) {

           if(index == 0) context.read<TogglemapCubit>().dragOrDrop();
        // if(index == 2){
        // context.read<ToggletrackCubit>().toggleTrackTab();
        // context.read<TogglegeofenceCubit>().toggleGeofenceFromMapTab();
        // context.read<TogglerouteCubit>().toggleRouteFromMapTab();
        // }
        // if(index ==0){
        // context.read<ToggletrackCubit>().toggleTrackTabFromMapTab();
        // context.read<TogglegeofenceCubit>().toggleGeofenceFromMapTab();
        //  context.read<TogglerouteCubit>().toggleRouteFromMapTab();

        // }
        //BlocProvider.of<ToggletrackCubit>(context).toggleTrackTab();
        
        onTabSelected(AppTab.values[index]);
        },
        selectedLabelStyle: TextStyle(
            fontFamily: "light",
            height: 2,
            fontSize: SizeConfig.screenWidth / 35),
        unselectedLabelStyle: TextStyle(
            fontFamily: "light",
            height: 2,
            fontSize: SizeConfig.screenWidth / 35),
        items: AppTab.values.map((tab) {
          return BottomNavigationBarItem(
              icon: Icon(iconTabsSwitch(tab)), label: labelTabsSwitch(tab));
        }).toList());
  }

  String labelTabsSwitch(AppTab tab) {
    switch (tab) {
      case AppTab.map:
        return "Map";
        break;
      case AppTab.reports:
        return "Reports";
        break;
      case AppTab.track:
        return "Track";
        break;
      case AppTab.notifications:
        return "Notifications";
        break;

      default:
        return "";
    }
  }

  IconData iconTabsSwitch(AppTab tab) {
    switch (tab) {
      case AppTab.map:
        return Ionicons.location_outline;
        break;
      case AppTab.reports:
        return Ionicons.document_text_outline;
        break;

      case AppTab.track:
        return Ionicons.locate_outline;
        break;

     
      case AppTab.notifications:
        return Ionicons.notifications_outline;
        break;
      default:
        return null;
    }
  }
}
