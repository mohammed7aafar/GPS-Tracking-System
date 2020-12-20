import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../theme.dart';
import '../blocs/tab/app_tab.dart';
import '../blocs/tab/tab.dart';
import '../blocs/tab/tab_bloc.dart';
import '../controllers/home_controller.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/home/tab_screens/map_screen.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocBuilder<TabBloc, AppTab>(builder: (context, activeTab) {
      return Scaffold(
        backgroundColor: AppTheme2.primaryColor,
        body: selectScreenTab(activeTab),
        bottomNavigationBar: BottomNavigationBarWidget(
          activeTab: activeTab,
          //! (tab) => value of appTab
          onTabSelected: (tab) =>
              BlocProvider.of<TabBloc>(context).add(TabUpdated(tab)),
        ),
      );
    });
  }

  selectScreenTab(activeTab) {
    switch (activeTab) {
      case AppTab.map:
        return MapTabScreen();
        break;
      case AppTab.reports:
        return Center(child: Container(child: Text("reports")));
        break;
      case AppTab.track:
        return Center(child: Container(child: Text("track")));
        break;
      case AppTab.monitor:
        return Center(child: Container(child: Text("monitor")));
        break;
      case AppTab.notifications:
        return Center(child: Container(child: Text("Notifications")));
        break;

      default: return Container();
    }
  }
}


