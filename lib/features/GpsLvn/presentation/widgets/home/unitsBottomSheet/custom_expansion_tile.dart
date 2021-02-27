// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:gpsLVN/core/utils/api_refrence.dart';
// import 'package:gpsLVN/core/utils/size_config.dart';
// import 'package:gpsLVN/features/GpsLvn/domain/entities/devices.dart' as device;
// import 'package:gpsLVN/features/GpsLvn/presentation/blocs/expansionToggle/expansiontoggle_cubit.dart';
// import 'package:gpsLVN/features/GpsLvn/presentation/blocs/map/map_bloc.dart';
// import 'package:ionicons/ionicons.dart';

// import '../../../../../../theme.dart';

// const Duration _kExpand = Duration(milliseconds: 200);

// class CustomExpansionTile extends StatefulWidget {
//   const CustomExpansionTile({
//     Key key,
//     this.subtitle,
//     this.backgroundColor,
//     this.children = const <Widget>[],
//     this.tilePadding,
//     this.childrenPadding,
//     this.initiallyExpanded = false,
//     this.gestureTapCallback,
//     this.onExpansionChanged,
//     this.item,
//   }) : super(key: key);

//   final device.Item item;
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

// class _ExpansionTileState extends State<CustomExpansionTile>
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
//     _controller = AnimationController(duration: _kExpand, vsync: this);
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
//     context.read<ExpansiontoggleCubit>().expandOrCollapse();

//     if (context.read<ExpansiontoggleCubit>().state) {
//       _controller.forward();
//     } else {
//       _controller.reverse();
//     }
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
//                 onTap: () => widget.gestureTapCallback(
//                     LatLng(widget.item.lat, widget.item.lng)),
//                 contentPadding: widget.tilePadding,
//                 // leading: Text(""),
//                 title: Row(
//                   children: [
//                     //  ExpansionTile()
//                     Flexible(
//                       child: Checkbox(
//                         value: widget.item.deviceData.checked == "0"
//                             ? false
//                             : true,
//                         onChanged: (bool value) {
//                           BlocProvider.of<FlutterMapBloc>(context).add(
//                               ItemsUpdated(widget.item.copyWith(
//                                   deviceData: widget.item.deviceData.copyWith(
//                                       checked:
//                                           widget.item.deviceData.checked == "0"
//                                               ? "1"
//                                               : "0"))));
//                         },
//                         //tristate: ,
//                         activeColor: AppTheme2.primaryColor18,
//                         checkColor: AppTheme2.primaryColor20,
//                       ),
//                     ),

//                     Flexible(
//                         child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: CachedNetworkImage(
//                         imageUrl:
//                             "${ApiRefrence.publicDomain}${widget.item.icon.path}",
//                         fit: BoxFit.contain,
//                         height: 24,
//                         width: 24,
//                         // placeholder: (context, url) => Container(color: Theme.of(context).focusColor,),
//                         // errorWidget: (context, url, error) => Image.asset("assets/car2.png",height: 24,
//                         //  width: 24,),
//                       ),
//                     )),

//                     Flexible(
//                         child: FractionallySizedBox(
//                       widthFactor: 1.1,
//                       child: Text(
//                         "${widget.item.name}",
//                         style: Theme.of(context).textTheme.headline6.copyWith(
//                             fontSize: SizeConfig.screenWidth / 35,
//                             color: AppTheme2.primaryColor18),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     )),

//                     Flexible(
//                         child: FractionallySizedBox(
//                       widthFactor: 1.5,
//                       child: Text(
//                         "",
//                       ),
//                     )),

//                     //   Spacer(flex: 2),

//                     Flexible(
//                         child: Container(
//                       padding: const EdgeInsets.all(8.0),
//                     )),
//                     InkWell(
//                       onTap: _handleTap,
//                       child: RotationTransition(
//                         turns: _iconTurns,
//                         child: const Icon(
//                           Icons.expand_more,
//                           color: AppTheme2.primaryColor18,
//                         ),
//                       ),
//                     ),

//                     Flexible(
//                       child: ClipOval(
//                           child: Material(
//                               color: AppTheme2.primaryColor20,
//                               child: IconButton(
//                                   highlightColor: AppTheme2.primaryColor21,
//                                   icon: Icon(
//                                     Ionicons.remove_circle_outline,
//                                     color: AppTheme2.primaryColor18,
//                                     // size: SizeConfig.screenWidth / 25,
//                                   ),
//                                   onPressed: null))),
//                     ),

//                     Flexible(
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Image.asset(
//                           "assets/satalite2.png",
//                           fit: BoxFit.contain,
//                           height: 20,
//                           width: 20,
//                         ),
//                       ),
//                     ),

//                     Flexible(
//                       child: ClipOval(
//                           child: Material(
//                               color: AppTheme2.primaryColor20,
//                               child: IconButton(
//                                   highlightColor: AppTheme2.primaryColor21,
//                                   icon: Icon(
//                                     Ionicons.ellipse,
//                                     color: AppTheme2.onlineColor,
//                                     // size: SizeConfig.screenWidth / 25,
//                                   ),
//                                   onPressed: null))),
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
//     return BlocBuilder<ExpansiontoggleCubit, bool>(builder: (context, state) {
//       final bool closed = !state && _controller.isDismissed;
//       final bool shouldRemoveChildren = closed;

//       final Widget result =  Padding(
//               padding: widget.childrenPadding ?? EdgeInsets.zero,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: widget.children,
//               ),
//             );
//       return AnimatedBuilder(
//         animation: _controller.view,
//         builder: _buildChildren,
//         child: shouldRemoveChildren ? null : result,
//       );
//     });
//   }
// }
