import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpsLVN/features/GpsLvn/domain/entities/devices.dart';
import '../../../../../../core/utils/api_refrence.dart';
import '../../../../../../theme.dart';
import 'custom_expansion_tile.dart';
import 'footer_expanded_unit_children.dart';
import 'header_expanded_units_children.dart';

class RowUnitsWidget extends StatelessWidget {
  const RowUnitsWidget({
    Key key,
    @required this.item,
    this.handleTap,
  }) : super(key: key);

  final Item item;
  final dynamic handleTap;

 _onChange(LatLng latLng) {
    handleTap(latLng);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme2.primaryColor20,
      child: Column(
        children: [
          CustomExpansionTile(
            handleTap: _onChange,
            unitName: "${item.name}",
            tilePadding: const EdgeInsets.all(0.0),
            imageUrl: "${ApiRefrence.publicDomain}${item.icon.path}",
            childrenPadding: const EdgeInsets.all(8.0),
            children: [
              UnitRowHeaderDetails(),
              UnitFooterDetails(),
            ],
            item: item,
          ),
          Divider(
            color: AppTheme2.clearColor,
            height: 2,
          ),
        ],
      ),
    );
  }
}
