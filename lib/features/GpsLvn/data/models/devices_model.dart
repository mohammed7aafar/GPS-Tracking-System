import 'package:gpsLVN/features/GpsLvn/domain/entities/devices.dart';
import 'package:json_annotation/json_annotation.dart';

part 'devices_model.g.dart';

@JsonSerializable()
class DevicesModel extends Devices {
  DevicesModel({
    List<Group> groups,
    User user,
    int status,
  })  :
        assert(groups != null),
        assert(user != null),
        assert(status != null),
        super(groups: groups, status: status, user: user);

 factory DevicesModel.fromJson(Map<String, dynamic> json) =>_$DevicesModelFromJson(json);
 Map<String, dynamic> toJson() => _$DevicesModelToJson(this);







}
