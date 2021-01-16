// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../core/constants/constants.dart';
// import '../../blocs/animatedIconCubit/animatedicon_cubit.dart';
// import '../../../../../theme.dart';
// import 'package:ionicons/ionicons.dart';

// import 'animations/animated_builder_page.dart';

// class AnimatedIconWidget extends StatefulWidget {
//   _AnimatedIconWidgetState createState() => _AnimatedIconWidgetState();
// }

// class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
//     with SingleTickerProviderStateMixin {
//   static final Animatable<double> _halfTween =   Tween<double>(begin: 0.0, end: 0.5);
//   static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);

//   Animation<double> _iconTurns;
//   AnimationController _animController;

//   bool _isExpanded = false;

//   @override
//   void initState() {
//     super.initState();
//     _animController = AnimationController(duration: kExpand, vsync: this);
//     _iconTurns = _animController.drive(_halfTween.chain(_easeInTween));
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("rebuilt");
//     return RotatingTransition(
//         angle: _iconTurns,
//         child: 
//                 BlocBuilder<AnimatediconCubit, bool>(builder: (context, state) {
//               return IconButton(
//                   icon: Icon(
//                     Ionicons.chevron_down_outline,
//                     color: AppTheme2.primaryColor18,
//                   ),
//                   onPressed: () {
//                     context.read<AnimatediconCubit>().expandOrCollapse();
//                     if (state) {
//                       _animController.forward();
//                     } else {
//                       _animController.reverse();
//                     }
//                   });
//             }));
//   }
// }

// //  setState(() {
// //             _isExpanded = !_isExpanded;

// //             if (_isExpanded) {
// //               _animController.forward();
// //             } else {
// //               _animController.reverse();
// //             }
// //           });
