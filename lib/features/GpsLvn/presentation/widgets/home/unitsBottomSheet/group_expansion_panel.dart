// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:gpsLVN/core/constants/constants.dart';
// import 'package:gpsLVN/core/utils/api_refrence.dart';
// import 'package:gpsLVN/core/utils/size_config.dart';
// import 'package:gpsLVN/features/GpsLvn/domain/entities/devices.dart' as devices;
// import 'package:gpsLVN/features/GpsLvn/presentation/blocs/expansionToggle/expansiontoggle_cubit.dart';
// import 'package:gpsLVN/features/GpsLvn/presentation/blocs/groupIcon/groupicon_cubit.dart';
// import 'package:gpsLVN/features/GpsLvn/presentation/blocs/map/map_bloc.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// import '../../../../../../theme.dart';

// class GeoupExpansionTile extends StatefulWidget {
//   const GeoupExpansionTile({
//     Key key,
//     this.subtitle,
//     this.backgroundColor,
//     this.children = const <Widget>[],
//     this.tilePadding,
//     this.childrenPadding,
//     this.initiallyExpanded = false,
//     this.gestureTapCallback,
//     this.onExpansionChanged,
//     this.group,
//   }) : super(key: key);

//   final devices.Group group;
//   final Widget subtitle;
//   final List<Widget> children;
//   final Color backgroundColor;
//   final EdgeInsetsGeometry tilePadding;
//   final EdgeInsetsGeometry childrenPadding;
//   final bool initiallyExpanded;
//   final ValueChanged<bool> onExpansionChanged;
//   final Function(LatLng latLng) gestureTapCallback;

//   @override
//   _ExpansionTileState createState() => _ExpansionTileState();
// }

// class _ExpansionTileState extends State<GeoupExpansionTile>
//     with SingleTickerProviderStateMixin {
//   static final Animatable<double> _easeOutTween =
//       CurveTween(curve: Curves.easeOut);
//   static final Animatable<double> _easeInTween =
//       CurveTween(curve: Curves.easeIn);
//   static final Animatable<double> _halfTween =
//       Tween<double>(begin: 0.0, end: 0.5);

//   final ColorTween _borderColorTween = ColorTween();
//   final ColorTween _headerColorTween = ColorTween();
//   final ColorTween _iconColorTween = ColorTween();
//   final ColorTween _backgroundColorTween = ColorTween();

//   AnimationController _controller;
//   Animation<double> _iconTurns;
//   Animation<double> _heightFactor;
//   Animation<Color> _borderColor;
//   Animation<Color> _headerColor;
//   Animation<Color> _iconColor;
//   Animation<Color> _backgroundColor;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(duration: kExpand, vsync: this);
//     _heightFactor = _controller.drive(_easeInTween);
//     _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
//     _borderColor = _controller.drive(_borderColorTween.chain(_easeOutTween));
//     _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
//     _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
//     _backgroundColor =
//         _controller.drive(_backgroundColorTween.chain(_easeOutTween));

//     // _isExpanded = PageStorage.of(context)?.readState(context) as bool ??
//     //     widget.initiallyExpanded;
//     // if (_isExpanded) _controller.value = 1.0;
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _handleTap() {
//     context.read<GroupiconCubit>().expandOrCollapse();

//     if (context.read<GroupiconCubit>().state) {
//       _controller.forward();
//     } else {
//       _controller.reverse();
//     }
//     PageStorage.of(context)
//         ?.writeState(context, context.read<GroupiconCubit>().state);

//     // if (widget.onExpansionChanged != null)
//     //   widget.onExpansionChanged(_isExpanded);
//   }

//   Widget _buildChildren(BuildContext context, Widget child) {
//     print("kooling");
//     final Color borderSideColor = _borderColor.value ?? Colors.transparent;
//     return Container(
//       decoration: BoxDecoration(
//         color: _backgroundColor.value ?? Colors.transparent,
//         border: Border(
//           top: BorderSide(color: borderSideColor),
//           bottom: BorderSide(color: borderSideColor),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           ListTileTheme.merge(
//               iconColor: _iconColor.value,
//               textColor: _headerColor.value,
//               child: ListTile(
//                 contentPadding: widget.tilePadding,
//                 // leading: Text(""),
//                 title: Row(
//                   children: [
//                     Flexible(
//                       child: RotationTransition(
//                         turns: _iconTurns,
//                         child: Checkbox(
//                           value: null,
//                           onChanged: (bool value) => _handleTap(),
//                           tristate: true,
//                           activeColor: AppTheme2.primaryColor18,
//                           checkColor: AppTheme2.primaryColor20,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Flexible(
//                       child: Checkbox(
//                         value: false,
//                         onChanged: (bool value) {},

//                         //tristate: true,
//                         activeColor: AppTheme2.primaryColor18,
//                         checkColor: AppTheme2.primaryColor20,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 30,
//                     ),
//                     Flexible(
//                       child: FractionallySizedBox(
//                           widthFactor: 2,
//                           child: Text(
//                             "${widget.group.title}",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headline6
//                                 .copyWith(
//                                     fontSize: SizeConfig.screenWidth / 35,
//                                     color: AppTheme2.primaryColor18),
//                           )),
//                     ),
//                     for (int i = 0; i < 6; i++)
//                       Flexible(
//                           child: FractionallySizedBox(
//                               widthFactor: 2, child: Container())),
//                     Flexible(
//                       child: ClipOval(
//                           child: Material(
//                               color: AppTheme2.primaryColor20,
//                               child: IconButton(
//                                 highlightColor: AppTheme2.primaryColor21,
//                                 icon: Icon(
//                                   Ionicons.cog_outline,
//                                   color: AppTheme2.primaryColor18,
//                                   // size: SizeConfig.screenWidth / 25,
//                                 ),
//                                 onPressed: () => showCupertinoModalBottomSheet(
//                                   expand: true,
//                                   bounce: true,
//                                   context: context,
//                                   backgroundColor: AppTheme2.primaryColor,
//                                   builder: (context) =>
//                                       viewGroupdetailsBottomSheet(context),
//                                 ),
//                               ))),
//                     ),
//                     Flexible(
//                       child: ClipOval(
//                           child: Material(
//                               color: AppTheme2.primaryColor20,
//                               child: IconButton(
//                                 highlightColor: AppTheme2.primaryColor21,
//                                 icon: Icon(
//                                   Ionicons.close_outline,
//                                   color: AppTheme2.clearColor,
//                                   // size: SizeConfig.screenWidth / 25,
//                                 ),
//                                 onPressed: () {
//                                   print("hi");
//                                 },
//                               ))),
//                     ),
//                   ],
//                 ),
//                 subtitle: widget.subtitle,
//               )),
//           ClipRect(
//             child: Align(
//               alignment: Alignment.center,
//               heightFactor: _heightFactor.value,
//               child: child,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void didChangeDependencies() {
//     final ThemeData theme = Theme.of(context);
//     _borderColorTween.end = theme.dividerColor;
//     _headerColorTween
//       ..begin = theme.textTheme.subtitle1.color
//       ..end = theme.accentColor;
//     _iconColorTween
//       ..begin = theme.unselectedWidgetColor
//       ..end = theme.accentColor;
//     _backgroundColorTween.end = widget.backgroundColor;
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GroupiconCubit, bool>(builder: (context, state) {
//       final bool closed = !state && _controller.isDismissed;
//       final bool shouldRemoveChildren = closed;

//       final Widget result = Offstage(
//           child: TickerMode(
//             child: Padding(
//               padding: widget.childrenPadding ?? EdgeInsets.zero,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: widget.children,
//               ),
//             ),
//             enabled: !closed,
//           ),
//           offstage: closed);
//       return AnimatedBuilder(
//         animation: _controller.view,
//         builder: _buildChildren,
//         child: shouldRemoveChildren ? null : result,
//       );
//     });
//   }

//   Widget viewGroupdetailsBottomSheet(context) {
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
//               Text(
//                 "Cancel",
//                 style: Theme.of(context).textTheme.headline5.copyWith(
//                       color: AppTheme2.territoryColor,
//                       fontSize: SizeConfig.screenWidth / 25,
//                     ),
//               ),
//               Text(
//                 "Group Name",
//                 style: Theme.of(context).textTheme.headline5.copyWith(
//                       color: AppTheme2.primaryColor18,
//                       fontSize: SizeConfig.screenWidth / 23,
//                     ),
//               ),
//               Text(
//                 "Add",
//                 style: Theme.of(context).textTheme.headline5.copyWith(
//                       color: AppTheme2.territoryColor,
//                       fontSize: SizeConfig.screenWidth / 25,
//                     ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           Material(
//               borderRadius: BorderRadius.circular(8),
//               color: AppTheme2.primaryColor20,
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(8.0),
//                 onTap: () {},
//                 child: Container(
//                     height: SizeConfig.screenWidth / 8,
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       // color: AppTheme2.primaryColor20,
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
//                     )),
//               )),
//           SizedBox(
//             height: 30,
//           ),
//           for (int index = 0; index < 3; index++) ...[
//             Material(
//               borderRadius: BorderRadius.circular(8),
//               color: AppTheme2.primaryColor20,
//               child: ListTile(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 onTap: () {},
//                 leading: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   // child: Image.asset(
//                   //   "${homeController.homeList[index].image}",
//                   //   fit: BoxFit.contain,
//                   // ),
//                 ),
//                 title: Text(
//                   "unit",
//                   style: Theme.of(context).textTheme.headline6.copyWith(
//                         color: AppTheme2.primaryColor18,
//                         fontSize: SizeConfig.screenWidth / 25,
//                       ),
//                 ),
//                 subtitle: Text(
//                   "sub",
//                   style: Theme.of(context).textTheme.headline2.copyWith(
//                         color: AppTheme2.primaryColor16,
//                         fontSize: SizeConfig.screenWidth / 28,
//                       ),
//                 ),
//                 // trailing:
//                 // Obx(
//                 //   () =>
//                 //     Icon(
//                 //   homeController.homeList[index].isSelected
//                 //       ? Ionicons.checkmark_circle_outline
//                 //       : Ionicons.radio_button_off_outline,
//                 //   color: homeController.homeList[index].isSelected
//                 //       ? AppTheme2.territoryColor
//                 //       : AppTheme2.primaryColor18,
//                 // ),
//               ),
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
