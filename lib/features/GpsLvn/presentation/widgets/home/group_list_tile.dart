import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:gpsLVN/core/utils/size_config.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/controllers/home_controller.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../../theme.dart';
import 'edit_units_bottom_sheet.dart';

class GroupListTileItems extends StatelessWidget {
  const GroupListTileItems({
    Key key,
  
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight:
              SizeConfig.screenHeight  / 7,
        ),
        child: Column(
          children: [
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
                    onDismissed: (actionType) =>
                        buildSnackbarDeleteGroupItems(index),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    onTap: () => showCupertinoModalBottomSheet(
                      expand: true,
                      bounce: true,
                      context: context,
                      backgroundColor: AppTheme2.primaryColor,
                      builder: (context) => showUnitsOfGroupBottomSheet(context),
                    ),
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
                          Ionicons.copy_outline,
                          color: AppTheme2.primaryColor18,
                        )
                        //  Image.asset("${homeController.homeList[index].image}", fit: BoxFit.contain,),
                        ),
                    title: Text(
                      "\n NAme",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: AppTheme2.primaryColor18,
                            fontSize: SizeConfig.screenWidth / 25,
                          ),
                    ),
                    subtitle: Text(
                      "",
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
          builder: (context) => viewGroupdetailsBottomSheet(context),
        ),
                    ),
                    IconSlideAction(
                        caption: '\nDelete',
                        color: AppTheme2.errorColor,
                        icon: Ionicons.trash,
                        closeOnTap: true,
                        onTap: () => buildSnackbarDeleteGroupItems(index)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ]
          ],
        )

        //        Column(
        //         children: <Widget>[
        //           Text("Header"),
        //           Expanded(
        //             child: Container(
        //               color: Colors.red,
        //             ),
        //           ),
        //           Text("Footer"),
        //         ],

        // )

        );

    //
  }

  Widget showUnitsOfGroupBottomSheet(context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppTheme2.primaryColor,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
          SizedBox(
            height: 10,
          ),
          Text(
            "Units Menue",
            style: Theme.of(context).textTheme.headline5.copyWith(
                  color: AppTheme2.primaryColor18,
                  fontSize: SizeConfig.screenWidth / 23,
                ),
          ),
          SizedBox(
            height: 40,
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
                    "name",
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

  buildSnackbarDeleteGroupItems(index) {
    // homeController.homeList.removeAt(index);
    // return Get.snackbar(
    //     "Group Items deleted", "click on add button to retrieve it",
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


   Widget viewGroupdetailsBottomSheet(context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppTheme2.primaryColor,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
           Text(
                        "Cancel",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: AppTheme2.territoryColor,
                              fontSize: SizeConfig.screenWidth / 25,
                            ),
                      
                
              ),
              Text(
                "Group Name",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: AppTheme2.primaryColor18,
                      fontSize: SizeConfig.screenWidth / 23,
                    ),
              ),
              Text(
                        "Add",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: AppTheme2.territoryColor,
                              fontSize: SizeConfig.screenWidth / 25,
                            ),
                      
              ),
            ],
          ),
          SizedBox(
            height: 40,
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
                    "name",
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
                  trailing:Icon(
                      Ionicons.checkmark_circle_outline,
                         
                      color: 
                          AppTheme2.primaryColor18,
                    
                  )),
            ),
            SizedBox(
              height: 10,
            )
          ]
        ]),
      ),
    );
  }
}
