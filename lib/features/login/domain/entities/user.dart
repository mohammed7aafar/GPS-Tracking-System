import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

class User extends Equatable {
  final int status;
  final String userApiHash;
  final Permissions permissions;

   User({this.status, this.userApiHash, this.permissions});

  @override
  List<Object> get props => [status, userApiHash, permissions];
}

@JsonSerializable()
class Permissions extends Equatable {
  final UserDevices devices;
  final UserDevices alerts;
  final UserDevices geofences;
  final UserDevices routes;
  final UserDevices poi;
  final UserDevices reports;
  final UserDevices smsGateway;
  final UserDevices sendCommand;
  final UserDevices history;
  final UserDevices maintenance;
  final UserDevices camera;
  final UserDevices deviceCamera;
  final UserDevices tasks;
  final UserDevices chat;
  final UserDevices deviceImei;
  final UserDevices deviceSimNumber;
  final UserDevices deviceForward;
  final UserDevices deviceProtocol;
  final UserDevices deviceActivationDate;
  final UserDevices deviceExpirationDate;
  final UserDevices deviceSimActivationDate;
  final UserDevices deviceSimExpirationDate;
  final UserDevices sharing;
  final UserDevices checklistTemplate;
  final UserDevices checklist;
  final UserDevices checklistActivity;
  final UserDevices checklistQrCode;
  final UserDevices checklistQrPreStartOnly;
  final UserDevices deviceConfiguration;

   Permissions(
      {this.devices,
      this.alerts,
      this.geofences,
      this.routes,
      this.poi,
      this.reports,
      this.smsGateway,
      this.sendCommand,
      this.history,
      this.maintenance,
      this.camera,
      this.deviceCamera,
      this.tasks,
      this.chat,
      this.deviceImei,
      this.deviceSimNumber,
      this.deviceForward,
      this.deviceProtocol,
      this.deviceActivationDate,
      this.deviceExpirationDate,
      this.deviceSimActivationDate,
      this.deviceSimExpirationDate,
      this.sharing,
      this.checklistTemplate,
      this.checklist,
      this.checklistActivity,
      this.checklistQrCode,
      this.checklistQrPreStartOnly,
      this.deviceConfiguration});

  factory Permissions.fromJson(Map<String, dynamic> json) =>
      _$PermissionsFromJson(json);
  Map<String, dynamic> toJson() => _$PermissionsToJson(this);

  @override
  List<Object> get props {
    return [
      devices,
      alerts,
      geofences,
      routes,
      poi,
      reports,
      smsGateway,
      sendCommand,
      history,
      maintenance,
      camera,
      deviceCamera,
      tasks,
      chat,
      deviceImei,
      deviceSimNumber,
      deviceForward,
      deviceProtocol,
      deviceActivationDate,
      deviceExpirationDate,
      deviceSimActivationDate,
      deviceSimExpirationDate,
      sharing,
      checklistTemplate,
      checklist,
      checklistActivity,
      checklistQrCode,
      checklistQrPreStartOnly,
      deviceConfiguration,
    ];
  }
}

@JsonSerializable()
class UserDevices extends Equatable {
  final bool view;
  final bool edit;
  final bool remove;

 UserDevices({this.view, this.edit, this.remove});

  factory UserDevices.fromJson(Map<String, dynamic> json) =>
      _$UserDevicesFromJson(json);
  Map<String, dynamic> toJson() => _$UserDevicesToJson(this);

  @override
  List<Object> get props => [view, edit, remove];
}
