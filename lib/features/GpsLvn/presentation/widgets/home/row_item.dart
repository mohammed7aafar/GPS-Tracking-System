// import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';
// import '../../../../../core/utils/size_config.dart';
// import '../../../../../theme.dart';
// import '../../controllers/home_controller.dart';

// class RowItemWidget extends StatelessWidget {
//   const RowItemWidget({
//     Key key,
//     this.onTap,
//     this.item, this.homeController, this.index,
//   }) : super(key: key);

//   final Function onTap;
//   final RowItemModel item;
//   final HomeController homeController;
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         flex: 1,
//         child: Material(
//             borderRadius: BorderRadius.circular(8),
//             color: AppTheme2.primaryColor20,
//             child: InkWell(
//                 borderRadius: BorderRadius.circular(8.0),
//                 onTap: onTap,
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
//                   height: 80,
//                   child: Column(
//                     children: [

                     
                                             
//                        Icon(
                         
                         
                         
//                         Ionicons.list_outline,
//                         //item.icon,
//                         color: item.color,
//                       ),
                      
                     
//                       SizedBox(
//                         height: 8,
//                       ),

                      
//                       // Text(
//                       //   "List",
//                       //   style: Theme.of(context).textTheme.headline6.copyWith(
//                       //         color: item.color,
//                       //         fontSize: SizeConfig.screenWidth / 25,
//                       //       ),
     
                      
//                       Text(
//                         "${item.title}",
//                         style: Theme.of(context).textTheme.headline6.copyWith(
//                               color: item.color,
//                               fontSize: SizeConfig.screenWidth / 25,
//                             ),

                      
//                       )
//                     ],
//                   ),
//                 ))));
//   }
// }
