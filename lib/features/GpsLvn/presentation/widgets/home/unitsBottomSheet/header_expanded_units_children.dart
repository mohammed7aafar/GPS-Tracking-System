


import 'package:flutter/material.dart';
import 'package:gpsLVN/core/utils/size_config.dart';
import 'package:gpsLVN/features/GpsLvn/domain/entities/devices.dart' as devices;
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../../theme.dart';
import '../edit_units_bottom_sheet.dart';

class UnitRowHeaderDetails extends StatelessWidget {
  const UnitRowHeaderDetails({
    Key key, this.item,
  }) : super(key: key);

 final devices.Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: ClipOval(
              child: Material(
                  color: AppTheme2.primaryColor20,
                  child: IconButton(
                    highlightColor: AppTheme2.primaryColor21,
                    icon:const Icon(
                      Ionicons.speedometer_outline,
                      color: AppTheme2.primaryColor18,
                      // size: SizeConfig.screenWidth / 25,
                    ),
                    onPressed: () {
                      print("hi");
                    },
                  ))),
        ),
        Flexible(
          flex: 1,
          child: Text(
            "0 Km/h ",
            style: Theme.of(context).textTheme.headline6.copyWith(
                fontSize: SizeConfig.screenWidth / 35,
                color: AppTheme2.primaryColor18),
          ),
        ),
        Flexible(
          child: ClipOval(
              child: Material(
                  color: AppTheme2.primaryColor20,
                  child: IconButton(
                    highlightColor: AppTheme2.primaryColor21,
                    icon: Icon(
                      Ionicons.cog_outline,
                      color: AppTheme2.primaryColor18,
                      // size: SizeConfig.screenWidth / 25,
                    ),
                    onPressed: () => showCupertinoModalBottomSheet(
                      expand: true,
                      bounce: true,
                      context: context,
                      backgroundColor: AppTheme2.primaryColor,
                      builder: (context) => EditUnitsBottomSheetWidget(),
                    ),
                  ))),
        ),
        Flexible(
          flex: 6,
          child: Text(
            "5 min 38 s ago (2020-05-21 am 12:23:25)",
            style: Theme.of(context).textTheme.headline6.copyWith(
                fontSize: SizeConfig.screenWidth / 35,
                color: AppTheme2.primaryColor18),
          ),
        ),
      ],
    );
  }
}