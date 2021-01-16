import 'package:flutter/material.dart';
import 'package:gpsLVN/core/utils/size_config.dart';
import '../../../../../theme.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme2.primaryColor,
        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "GPS LVN",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: SizeConfig.screenWidth / 10,
                      color: AppTheme2.primaryColor18
                      ),
                ),
                SizedBox(height: 10,),
                Text(
                  "New generation of tracking systems",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(fontSize: SizeConfig.screenWidth / 23,
                      color: AppTheme2.primaryColor17),
                )
              ],
            )));
  }
}
