// import 'package:flutter/material.dart';
// import '../../../../../core/utils/size_config.dart';
// import '../../../../../theme.dart';

// import 'row_items.dart';

// class DraggableScrollableSheetItems extends StatelessWidget {
//   const DraggableScrollableSheetItems({
//     Key key,
   
   
//   }) : super(key: key);


 

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 0),
//         width: double.infinity,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
//             color: AppTheme2.primaryColor),
//         child: SingleChildScrollView(
         
          
//           child: Column(
//             //mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 height: 20,
//               ),

//               Center(
//                 child: Container(
//                   height: 5.5,
//                   width: 45,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       color: AppTheme2.primaryColor21),
//                 ),
//               ),
//               // Obx(
//               //   () => homeController.isArrowShown.value
//               //       ?
//               //       : LoaderOne(),
//               //),
//               SizedBox(
//                 height: 20,
//               ),
//               RowItems(
               
//               ),

//               SizedBox(
//                 height: 20,
//               ),

//               // Obx(
//               //   () => homeController.homeList.length > 0
//               //       ? //Placeholder(fallbackHeight: 20,fallbackWidth: 20,)
//               //       homeController.isGroupOrList.value
//               //           ? GroupListTileItems(homeController: homeController)
//               //           : ListTileItems(homeController: homeController)
//               //       : Text(
//               //           "Nothing to show",
//               //           style: Theme.of(context).textTheme.headline6.copyWith(
//               //                 color: AppTheme2.primaryColor18,
//               //                 fontSize: SizeConfig.screenWidth / 23,
//               //               ),
//               //         ),
//               // ),
//             ],
//           ),
//         ));
//   }
// }
