
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import '../../../../../core/utils/size_config.dart';
import '../../../../../theme.dart';




class EditUnitsBottomSheetWidget extends StatelessWidget {
  const EditUnitsBottomSheetWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               // Obx(
               //   () => homeController.saved.isNotEmpty
               //       ? Text(
               //           "Cancel",
               //           style: Theme.of(context).textTheme.headline5.copyWith(
               //                 color: AppTheme2.territoryColor,
               //                 fontSize: SizeConfig.screenWidth / 25,
               //               ),
               //         )
               //       : Container(),
               // ),
               Text(
                 "Units Details",
                 style: Theme.of(context).textTheme.headline5.copyWith(
                       color: AppTheme2.primaryColor18,
                       fontSize: SizeConfig.screenWidth / 23,
                     ),
               ),
               // Obx(
               //   () => homeController.saved.isNotEmpty
               //       ? Text(
               //           "Add",
               //           style: Theme.of(context).textTheme.headline5.copyWith(
               //                 color: AppTheme2.territoryColor,
               //                 fontSize: SizeConfig.screenWidth / 25,
               //               ),
               //         )
               //       : Container(),
               // ),
             ],
           ),
           SizedBox(
             height: 40,
           ),
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
                   style: Theme.of(context).textTheme.headline6.copyWith(
                       fontSize: SizeConfig.screenWidth / 30,
                       color: AppTheme2.whiteColor),
                   decoration: InputDecoration(
                       hintText: "Name",
                       hintStyle: Theme.of(context).textTheme.headline6.copyWith(
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
               child: 
            InkWell(
              onTap: ()=> Get.bottomSheet(Container(),backgroundColor: AppTheme2.primaryColor),
             borderRadius: BorderRadius.circular(8.0),
              child: Container(
                     height: SizeConfig.screenWidth / 8,
                     padding: EdgeInsets.all(15),
                     decoration: BoxDecoration(
                      
                       borderRadius: BorderRadius.circular(8),
                      
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         // Obx(
                         //   () => 
                           Text("Icon Type",
                             //loginController.hostServerName.value,
                             style: Theme.of(context).textTheme.headline6.copyWith(
                                 fontSize: SizeConfig.screenWidth / 30,
                                 color: AppTheme2.primaryColor18
                                 ),
                           ),
                         //),
                         IconButton(
                             padding: EdgeInsets.symmetric(vertical: 0),
                             icon: Icon(
                               Icons.keyboard_arrow_down_outlined,
                               size: SizeConfig.screenWidth / 15,
                               color: AppTheme2.primaryColor18,
                             ),
                             onPressed: (){}
                             )
                       ],
               )),
            )),

              SizedBox(
             height: 20,
           ),
             Material(
               borderRadius: BorderRadius.circular(8),
               color: AppTheme2.primaryColor20,
               child: 
            InkWell(
                borderRadius: BorderRadius.circular(8.0),
              onTap: ()=> Get.bottomSheet(Container(),backgroundColor: AppTheme2.primaryColor),
              child: Container(
                     height: SizeConfig.screenWidth / 8,
                     padding: EdgeInsets.all(15),
                     decoration: BoxDecoration(
                      
                       borderRadius: BorderRadius.circular(8),
                      
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         // Obx(
                         //   () => 
                           Text("Group",
                             //loginController.hostServerName.value,
                             style: Theme.of(context).textTheme.headline6.copyWith(
                                 fontSize: SizeConfig.screenWidth / 30,
                                 color: AppTheme2.primaryColor18
                                 ),
                           ),
                         //),
                         IconButton(
                             padding: EdgeInsets.symmetric(vertical: 0),
                             icon: Icon(
                               Icons.keyboard_arrow_down_outlined,
                               size: SizeConfig.screenWidth / 15,
                               color: AppTheme2.primaryColor18,
                             ),
                             onPressed: (){}
                             )
                       ],
               )),
            )),

              SizedBox(
             height: 20,
           ),


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
                   style: Theme.of(context).textTheme.headline6.copyWith(
                       fontSize: SizeConfig.screenWidth / 30,
                       color: AppTheme2.whiteColor),
                   decoration: InputDecoration(
                       hintText: "Plate Number",
                       hintStyle: Theme.of(context).textTheme.headline6.copyWith(
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
               child: Container(
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
                       hintText: "Object Number",
                       hintStyle: Theme.of(context).textTheme.headline6.copyWith(
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
               child: Container(
                 height: SizeConfig.screenWidth / 3,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8),
                   color: AppTheme2.primaryColor20,
                 ),
                 child: TextFormField(
                   //expands: true,
                   maxLines: 50,
                   minLines: 1,
                   style: Theme.of(context).textTheme.headline6.copyWith(
                       fontSize: SizeConfig.screenWidth / 30,
                       color: AppTheme2.whiteColor),
                   decoration: InputDecoration(
                       hintText: "Notes",
                       hintStyle: Theme.of(context).textTheme.headline6.copyWith(
                           fontSize: SizeConfig.screenWidth / 30,
                           color: AppTheme2.primaryColor18),
                       border: InputBorder.none,
                       contentPadding: EdgeInsets.all(15)),
                 ),
               )),
           //SizedBox.expand()

         ]),
       ),
     );
  }
}