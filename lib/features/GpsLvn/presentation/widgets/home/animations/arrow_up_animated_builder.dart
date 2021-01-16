import 'package:flutter/material.dart';

class SlidingTransition extends StatelessWidget {
  SlidingTransition({
    // Give the animation a better fitting name - we're animating the angle of rotation.
    @required this.offSet,
    @required this.child,
  });

  final Widget child;
  final Animation<Offset> offSet;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: offSet,
      // This child will be pre-built by the AnimatedBuilder for performance optimizations
      // since it won't be rebuilt on every "animation tick".
      child: child,
      builder: (context, child) {
        return SlideTransition(
          position: offSet,
          child: child,
        );
      },
    );
  }
}