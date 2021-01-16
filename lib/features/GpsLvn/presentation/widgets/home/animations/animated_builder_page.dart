import 'package:flutter/material.dart';

class RotatingTransition extends StatelessWidget {
  RotatingTransition({
    // Give the animation a better fitting name - we're animating the angle of rotation.
    @required this.angle,
    @required this.child,
  });

  final Widget child;
  final Animation<double> angle;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: angle,
      // This child will be pre-built by the AnimatedBuilder for performance optimizations
      // since it won't be rebuilt on every "animation tick".
      child: child,
      builder: (context, child) {
        return RotationTransition(
          turns: angle,
          child: child,
        );
      },
    );
  }
}