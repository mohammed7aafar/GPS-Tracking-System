import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/widgets/hooks/scroll_controller_for_animation.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../theme.dart';
import '../controllers/home_controller.dart';
import '../widgets/jobs/edit_jobs.dart';
import '../widgets/notifications/edit_notifications_bottom_sheet.dart';

class JobsPage extends HookWidget {
  const JobsPage({Key key, this.homeController}) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final hideFabAnimController = useAnimationController(
        duration: kThemeAnimationDuration, initialValue: 1);

    final scrollController =
        useScrollControllerForAnimation(hideFabAnimController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text(
          "Jobs",
          style: Theme.of(context).textTheme.headline5.copyWith(
                color: AppTheme2.whiteColor,
                fontSize: SizeConfig.screenWidth / 23,
              ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
          padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 0),
          width: double.infinity,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
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
                                "Event Search",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        fontSize: SizeConfig.screenWidth / 30,
                                        color: AppTheme2.primaryColor18),
                              )
                            ],
                          )),
                    )),
                SizedBox(
                  height: 20,
                ),
                for (int index = 0; index < 12; index++) ...[
                  Material(
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme2.primaryColor20,
                    child: Slidable(
                      key: UniqueKey(),
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      dismissal: SlidableDismissal(
                        child: SlidableDrawerDismissal(),
                        onDismissed: (actionType) =>
                            buildSnackbarDeleteItem(index),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        onTap: () {},
                        leading: Container(
                            width: SizeConfig.screenWidth / 7,
                            height: SizeConfig.screenWidth / 7,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              shape: BoxShape.rectangle,
                              color: AppTheme2.primaryColor21,
                              //border: Border.all(color: AppTheme2.primaryColor12),
                            ),
                            child: Icon(
                              Ionicons.notifications_outline,
                              color: AppTheme2.primaryColor18,
                            )
                            //  Image.asset("${homeController.homeList[index].image}", fit: BoxFit.contain,),
                            ),
                        title: Text(
                          "Device Protocol Message ",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: AppTheme2.primaryColor18,
                                fontSize: SizeConfig.screenWidth / 30,
                              ),
                        ),
                        subtitle: Text(
                          "Parameters",
                          style: Theme.of(context).textTheme.headline2.copyWith(
                                color: AppTheme2.primaryColor16,
                                fontSize: SizeConfig.screenWidth / 35,
                              ),
                        ),
                        trailing: Icon(
                          Ionicons.chevron_forward_outline,
                          color: AppTheme2.primaryColor18,
                        ),
                      ),
                      secondaryActions: <Widget>[
                        IconSlideAction(
                            caption: '\nEdit',
                            color: AppTheme2.editColor,
                            icon: Ionicons.create,
                            closeOnTap: true,
                            onTap: () => showCupertinoModalBottomSheet(
                                  expand: true,
                                  bounce: true,
                                  context: context,
                                  backgroundColor: AppTheme2.primaryColor,
                                  builder: (context) => EditJobsBottomSheet(),
                                )),
                        IconSlideAction(
                            caption: '\nDelete',
                            color: AppTheme2.errorColor,
                            icon: Ionicons.trash,
                            closeOnTap: true,
                            onTap: () => buildSnackbarDeleteItem(index)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
                SizedBox(
                  height: 80,
                )
              ],
            ),
          )),
      floatingActionButton: FadeTransition(
          opacity: hideFabAnimController,
          child: ScaleTransition(
              scale: hideFabAnimController,
              child: FloatingActionButton(
                onPressed: () => showCupertinoModalBottomSheet(
                  expand: true,
                  bounce: true,
                  context: context,
                  backgroundColor: AppTheme2.primaryColor,
                  builder: (context) => EditJobsBottomSheet(),
                ),
                backgroundColor: AppTheme2.whiteColor,
                child: Icon(
                  Ionicons.add_outline,
                  color: AppTheme2.primaryColor20,
                ),
                tooltip: "Add",
              ))),
    );
  }

  void buildSnackbarDeleteItem(index) {
    homeController.homeList.removeAt(index);
    // return Get.snackbar(
    //     "Unit Item deleted", "click on add button to retrieve it",
    //     colorText: AppTheme2.primaryColor18,

    //     //duration: Duration(minutes: 34),
    //     icon: Icon(
    //       Ionicons.trash,
    //       color: AppTheme2.errorColor,
    //       size: SizeConfig.screenWidth / 15,
    //     ),
    //     borderRadius: 8.0,
    //     snackPosition: SnackPosition.TOP,
    //     backgroundColor: AppTheme2.primaryColor20,
    //     padding: EdgeInsets.all(18),
    //     shouldIconPulse: false);
  }
}
