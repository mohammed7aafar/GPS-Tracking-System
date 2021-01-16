import 'package:flutter/material.dart';
import 'package:gpsLVN/core/utils/size_config.dart';

import '../../../../../../theme.dart';

class UnitFooterDetails extends StatelessWidget {
  const UnitFooterDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: AppTheme2.primaryColor21, width: 2),
      children: [
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Sensor Values :",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: SizeConfig.screenWidth / 35,
                  color: AppTheme2.primaryColor18),
            ),
          ),
          Text(""),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Engine: Off (2h 54 min ago) ",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: SizeConfig.screenWidth / 35,
                  color: AppTheme2.primaryColor18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "State: stop (2h 55 min ago)",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: SizeConfig.screenWidth / 35,
                  color: AppTheme2.primaryColor18),
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "GSM level: N/A",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: SizeConfig.screenWidth / 35,
                  color: AppTheme2.primaryColor18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "HDOP: N/A",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: SizeConfig.screenWidth / 35,
                  color: AppTheme2.primaryColor18),
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "External Power: 13.02 V",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: SizeConfig.screenWidth / 35,
                  color: AppTheme2.primaryColor18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Internal Battery: 7.96 V",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: SizeConfig.screenWidth / 35,
                  color: AppTheme2.primaryColor18),
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Mode: Sleep (2h 48 min ago)",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: SizeConfig.screenWidth / 35,
                  color: AppTheme2.primaryColor18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Engine cut: No (8h 1min ago)",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: SizeConfig.screenWidth / 35,
                  color: AppTheme2.primaryColor18),
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Fuel: N/A",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: SizeConfig.screenWidth / 35,
                  color: AppTheme2.primaryColor18),
            ),
          ),
          Text(""),
        ]),
      ],
    );
  }
}
