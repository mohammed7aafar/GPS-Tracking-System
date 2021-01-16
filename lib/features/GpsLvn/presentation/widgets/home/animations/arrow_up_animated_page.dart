import 'package:flutter/material.dart';

import 'arrow_up_animated_builder.dart';

class AnimatedArrowPage extends StatefulWidget {
  const AnimatedArrowPage({Key key}) : super(key: key);
  _AnimatedArrowPageState createState() => _AnimatedArrowPageState();
}

class _AnimatedArrowPageState extends State<AnimatedArrowPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    animation = Tween(begin: Offset(0.0, -0.30), end: Offset.zero).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingTransition(
      offSet: animation,
      child: Image.asset(
        "assets/arrow.png",
        height: 40,
        width: 40,
      ),
    );
  }
}
