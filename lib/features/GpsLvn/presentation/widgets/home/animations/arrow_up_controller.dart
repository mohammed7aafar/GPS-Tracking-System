import 'package:flutter/material.dart';

class LoaderOne extends StatefulWidget {
 


  const LoaderOne({Key key}) : super(key: key);
  _LoaderOneState createState() => _LoaderOneState();
}

class _LoaderOneState extends State<LoaderOne>
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
    );

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SlideTransition(
            position: animation,

            child: Image.asset("assets/arrow.png", height: 40, width: 40,)
            
            // Icon(
            //   widget.icon,
            //   size: 20,
            //   color: AppTheme2.territoryColor,
            // ),
          ),
        ],
      ),
    );
  }
}
