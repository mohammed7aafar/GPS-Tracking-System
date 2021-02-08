// import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import '../../../../../core/utils/size_config.dart';
// import '../../../../../theme.dart';
// import '../../controllers/home_controller.dart';
// import 'row_item.dart';

// class RowItems extends StatelessWidget {
//   const RowItems({
//     Key key,
//     this.homeController,
//   }) : super(key: key);

//   final HomeController homeController;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         for (int index = 0;
//             index < homeController.rowItemList.length;
//             index++) ...[
//           RowItemWidget(
//               index: index,
//               homeController: homeController,
//               item: homeController.rowItemList[index],
//               onTap: () => chooseRowItemFunction(index, context)),
//           index > 2
//               ? Container()
//               : SizedBox(
//                   width: 10,
//                 )
//         ]
//       ],
//     );
//   }

//   chooseRowItemFunction(int index, BuildContext context) {
//     switch (index) {
//       case 0:
//         return buildFilterBottomSheet(context);
//         break;

//       case 1:
//         return showCupertinoModalBottomSheet(
//           expand: true,
//           bounce: true,
//           context: context,
//           backgroundColor: AppTheme2.primaryColor,
//           builder: (context) => addUnitsToViewBottomSheet(context),
//         );

//       // case 2:
//       //   return showGroupOrListItems();
//       //   break;

//       // case 2:
//       // return
//       default:
//     }
//   }

//   // showGroupOrListItems() => homeController.showGroupOrListItems();

//   buildFilterBottomSheet(BuildContext context) {
//     return

//     showModalBottomSheet(
//                     context: context,
//                     builder: (context) {
      
//     return   Container(
//       height: SizeConfig.screenHeight / 2.5,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: AppTheme2.primaryColor,
//       ),
//       child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//         Center(
//             child: Padding(
//           padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//           child: Container(
//             height: 5.5,
//             width: 45,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: AppTheme2.primaryColor11),
//           ),
//         )),
//         for (int i = 0; i < homeController.filterList.length; i++) ...[
//           Material(
//               color: AppTheme2.primaryColor,
//               child: ListTile(
//                 onTap: () {},
//                 leading: Icon(
//                   homeController.filterList[i].icon,
//                   color: AppTheme2.primaryColor18,
//                 ),
//                 title: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   child: Text(
//                     "${homeController.filterList[i].title}",
//                     style: Theme.of(context).textTheme.headline4.copyWith(
//                           color: AppTheme2.primaryColor18,
//                           fontSize: SizeConfig.screenWidth / 25,
//                         ),
//                   ),
//                 ),
//               ))
//         ]
//       ]),
//     );
//                     });
//   }

//   Widget addUnitsToViewBottomSheet(context) {
//     return SingleChildScrollView(
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.only(left: 20.0, right: 20.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: AppTheme2.primaryColor,
//         ),
//         child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//           Center(
//               child: Padding(
//             padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//             child: Container(
//               height: 5.5,
//               width: 45,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: AppTheme2.primaryColor11),
//             ),
//           )),
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//              Text(
//                         "Cancel",
//                         style: Theme.of(context).textTheme.headline5.copyWith(
//                               color: AppTheme2.territoryColor,
//                               fontSize: SizeConfig.screenWidth / 25,
//                             ),
                      
                  
//               ),
//               Text(
//                 "Add Units To View",
//                 style: Theme.of(context).textTheme.headline5.copyWith(
//                       color: AppTheme2.primaryColor18,
//                       fontSize: SizeConfig.screenWidth / 23,
//                     ),
//               ),
//               Text(
//                         "Add",
//                         style: Theme.of(context).textTheme.headline5.copyWith(
//                               color: AppTheme2.territoryColor,
//                               fontSize: SizeConfig.screenWidth / 25,
//                             ),
                     
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           Material(
//               borderRadius: BorderRadius.circular(8),
//               color: AppTheme2.primaryColor20,
//               child:
//                InkWell(
//                  borderRadius: BorderRadius.circular(8.0),
//                  onTap: (){},
//                   child: Container(
//                     height: SizeConfig.screenWidth / 8,
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                      // color: AppTheme2.primaryColor20,
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Ionicons.search_outline,
//                           color: AppTheme2.primaryColor18,
//                         ),
//                         SizedBox(
//                           width: 13,
//                         ),
//                         Text(
//                           "Search",
//                           style: Theme.of(context).textTheme.headline6.copyWith(
//                               fontSize: SizeConfig.screenWidth / 30,
//                               color: AppTheme2.primaryColor18),
//                         )
//                       ],
//                     )

                 
//                     ),
//                )),
//           SizedBox(
//             height: 30,
//           ),
//           for (int index = 0;
//               index < homeController.homeList.length;
//               index++) ...[
//             Material(
//               borderRadius: BorderRadius.circular(8),
//               color: AppTheme2.primaryColor20,
//               child: ListTile(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   onTap: () {},
//                   leading: Container(
//                       width: SizeConfig.screenWidth / 7,
//                       height: SizeConfig.screenWidth / 7,
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8.0),
//                         shape: BoxShape.rectangle,
//                         color: AppTheme2.primaryColor21,
//                         //border: Border.all(color: AppTheme2.primaryColor12),
//                       ),
//                       child: Icon(
//                         Ionicons.car_outline,
//                         color: AppTheme2.primaryColor18,
//                       )
//                       //  Image.asset("${homeController.homeList[index].image}", fit: BoxFit.contain,),
//                       ),
//                   title: Text(
//                     "${homeController.homeList[index].unitName}",
//                     style: Theme.of(context).textTheme.headline6.copyWith(
//                           color: AppTheme2.primaryColor18,
//                           fontSize: SizeConfig.screenWidth / 25,
//                         ),
//                   ),
//                   subtitle: Text(
//                     "${homeController.homeList[index].location}",
//                     style: Theme.of(context).textTheme.headline2.copyWith(
//                           color: AppTheme2.primaryColor16,
//                           fontSize: SizeConfig.screenWidth / 28,
//                         ),
//                   ),
//                   trailing: Icon(
//                       homeController.homeList[index].isSelected
//                           ? Ionicons.checkmark_circle_outline
//                           : Ionicons.radio_button_off_outline,
//                       color: homeController.homeList[index].isSelected
//                           ? AppTheme2.territoryColor
//                           : AppTheme2.primaryColor18,
//                     ),
//                   ),
//             ),
//             SizedBox(
//               height: 10,
//             )
//           ]
//         ]),
//       ),
//     );
//   }
// }
