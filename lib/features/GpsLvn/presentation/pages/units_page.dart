import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/widgets/hooks/scroll_controller_for_animation.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../theme.dart';
import '../controllers/home_controller.dart';
import '../widgets/home/edit_units_bottom_sheet.dart';

class UnitsPage extends HookWidget {
  const UnitsPage({Key key}) : super(key: key);
   
   
  @override
  Widget build(BuildContext context) {
        final hideFabAnimController = useAnimationController(
        duration: kThemeAnimationDuration, initialValue: 1);

    final scrollController =
        useScrollControllerForAnimation(hideFabAnimController);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text(
            "Units Menue",
            style: Theme.of(context).textTheme.headline5.copyWith(
                  color: AppTheme2.primaryColor18,
                  fontSize: SizeConfig.screenWidth / 23,
                ),
          ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppTheme2.primaryColor,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 30,
          ),
           Material(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme2.primaryColor20,
              child:
               InkWell(
                 borderRadius: BorderRadius.circular(8.0),
                 onTap: (){},
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
                    )

                 
                    ),
               )),
          SizedBox(
            height: 30,
          ),
         
          for (int index = 0;
              index < 3;
              index++) ...[
            Material(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme2.primaryColor20,
              child: Slidable(
                key: UniqueKey(),
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                dismissal: SlidableDismissal(
                  child: SlidableDrawerDismissal(),
                  onDismissed: (actionType) => buildSnackbarDeleteItem(index),
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
                        Ionicons.car_outline,
                        color: AppTheme2.primaryColor18,
                      )
                      //  Image.asset("${homeController.homeList[index].image}", fit: BoxFit.contain,),
                      ),
                  title: Text(
                    "Name",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: AppTheme2.primaryColor18,
                          fontSize: SizeConfig.screenWidth / 25,
                        ),
                  ),
                  subtitle: Text(
                    "location",
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          color: AppTheme2.primaryColor16,
                          fontSize: SizeConfig.screenWidth / 28,
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
                              builder: (context) => EditUnitsBottomSheetWidget(),
                            )
                    
                    
                  ),
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
          ]
        ]),
      ),
    ),

      floatingActionButton:
       FadeTransition(
                        opacity: hideFabAnimController,
                        child: ScaleTransition(
                            scale: hideFabAnimController,
                            child:
       FloatingActionButton(
        onPressed: () => showCupertinoModalBottomSheet(
          expand: true,
          bounce: true,
          context: context,
          backgroundColor: AppTheme2.primaryColor,
          builder: (context) => EditUnitsBottomSheetWidget(),
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
    // homeController.homeList.removeAt(index);
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