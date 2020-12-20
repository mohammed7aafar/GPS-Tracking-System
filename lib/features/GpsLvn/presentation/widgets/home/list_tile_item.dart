import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../theme.dart';
import '../../controllers/home_controller.dart';
import 'edit_units_bottom_sheet.dart';

class ListTileItems extends StatelessWidget {
  const ListTileItems({
    Key key,
    @required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight:
              SizeConfig.screenHeight * homeController.homeList.length / 9,
        ),
        child: Column(
          children: [
            for (int index = 0;
                index < homeController.homeList.length;
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
                      "${homeController.homeList[index].unitName}",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: AppTheme2.primaryColor18,
                            fontSize: SizeConfig.screenWidth / 25,
                          ),
                    ),
                    subtitle: Text(
                      "${homeController.homeList[index].location}",
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



  void buildSnackbarDeleteItem(index) {
    homeController.homeList.removeAt(index);
    return Get.snackbar(
        "Unit Item deleted", "click on add button to retrieve it",
        colorText: AppTheme2.primaryColor18,

        //duration: Duration(minutes: 34),
        icon: Icon(
          Ionicons.trash,
          color: AppTheme2.errorColor,
          size: SizeConfig.screenWidth / 15,
        ),
        borderRadius: 8.0,
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppTheme2.primaryColor20,
        padding: EdgeInsets.all(18),
        shouldIconPulse: false);
  }
}


