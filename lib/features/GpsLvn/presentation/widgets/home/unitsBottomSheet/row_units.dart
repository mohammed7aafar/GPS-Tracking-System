import 'package:flutter/material.dart';

import '../../../../../../core/utils/api_refrence.dart';
import '../../../../../../theme.dart';
import '../../../../domain/entities/devices.dart' as devices;
import 'custom_expansion_tile.dart';
import 'footer_expanded_unit_children.dart';
import 'header_expanded_units_children.dart';

class RowUnitsWidget extends StatelessWidget {
  const RowUnitsWidget({
    Key key,
    @required this.groups,
    this.handleTap,
    this.index,
    this.index2,
  }) : super(key: key);

  final List<devices.Group> groups;
  final GestureTapCallback handleTap;
  final int index, index2;

  @override
  Widget build(BuildContext context) {
      return Container(
        color: AppTheme2.primaryColor20,
        child: Column(
          children: [
            CustomExpansionTile(
              handleTap: handleTap,
              unitName: "${groups[index].items[index2].name}",
              tilePadding: const EdgeInsets.all(0.0),
              imageUrl:
                  "${ApiRefrence.publicDomain}${groups[index].items[index2].icon.path}",
              childrenPadding: const EdgeInsets.all(8.0),
              children: [
                UnitRowHeaderDetails(),
                UnitFooterDetails(),
              ],
            ),
            Divider(
              color: AppTheme2.clearColor,
              height: 2,
            ),
          ],
        ),
      );
  }

// Widget showSatellitesImage(List<devices.Sensor> sensors){

//   sensors.map((e) =>

//   e.type

//   )

//    if(int.parse(val) >= 0  && int.parse(val) < 5 ){
// return   sataliteimage(number: 3);
//    }

//    else if(int.parse(val) >= 5 && int.parse(val) < 10){
// return  sataliteimage(number: 2);
//    }

//    else if(int.parse(val) > 10){
// return  sataliteimage();
//    }

//    else{
//      return Container();
//    }

//   }

// Image sataliteimage({int number}) {
//   return
// }
}
