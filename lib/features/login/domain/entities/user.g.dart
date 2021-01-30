// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Permissions _$PermissionsFromJson(Map<String, dynamic> json) {
  return Permissions(
    devices: json['devices'] == null
        ? null
        : UserDevices.fromJson(json['devices'] as Map<String, dynamic>),
    alerts: json['alerts'] == null
        ? null
        : UserDevices.fromJson(json['alerts'] as Map<String, dynamic>),
    geofences: json['geofences'] == null
        ? null
        : UserDevices.fromJson(json['geofences'] as Map<String, dynamic>),
    routes: json['routes'] == null
        ? null
        : UserDevices.fromJson(json['routes'] as Map<String, dynamic>),
    poi: json['poi'] == null
        ? null
        : UserDevices.fromJson(json['poi'] as Map<String, dynamic>),
    reports: json['reports'] == null
        ? null
        : UserDevices.fromJson(json['reports'] as Map<String, dynamic>),
    smsGateway: json['smsGateway'] == null
        ? null
        : UserDevices.fromJson(json['smsGateway'] as Map<String, dynamic>),
    sendCommand: json['sendCommand'] == null
        ? null
        : UserDevices.fromJson(json['sendCommand'] as Map<String, dynamic>),
    history: json['history'] == null
        ? null
        : UserDevices.fromJson(json['history'] as Map<String, dynamic>),
    maintenance: json['maintenance'] == null
        ? null
        : UserDevices.fromJson(json['maintenance'] as Map<String, dynamic>),
    camera: json['camera'] == null
        ? null
        : UserDevices.fromJson(json['camera'] as Map<String, dynamic>),
    deviceCamera: json['deviceCamera'] == null
        ? null
        : UserDevices.fromJson(json['deviceCamera'] as Map<String, dynamic>),
    tasks: json['tasks'] == null
        ? null
        : UserDevices.fromJson(json['tasks'] as Map<String, dynamic>),
    chat: json['chat'] == null
        ? null
        : UserDevices.fromJson(json['chat'] as Map<String, dynamic>),
    deviceImei: json['deviceImei'] == null
        ? null
        : UserDevices.fromJson(json['deviceImei'] as Map<String, dynamic>),
    deviceSimNumber: json['deviceSimNumber'] == null
        ? null
        : UserDevices.fromJson(json['deviceSimNumber'] as Map<String, dynamic>),
    deviceForward: json['deviceForward'] == null
        ? null
        : UserDevices.fromJson(json['deviceForward'] as Map<String, dynamic>),
    deviceProtocol: json['deviceProtocol'] == null
        ? null
        : UserDevices.fromJson(json['deviceProtocol'] as Map<String, dynamic>),
    deviceActivationDate: json['deviceActivationDate'] == null
        ? null
        : UserDevices.fromJson(
            json['deviceActivationDate'] as Map<String, dynamic>),
    deviceExpirationDate: json['deviceExpirationDate'] == null
        ? null
        : UserDevices.fromJson(
            json['deviceExpirationDate'] as Map<String, dynamic>),
    deviceSimActivationDate: json['deviceSimActivationDate'] == null
        ? null
        : UserDevices.fromJson(
            json['deviceSimActivationDate'] as Map<String, dynamic>),
    deviceSimExpirationDate: json['deviceSimExpirationDate'] == null
        ? null
        : UserDevices.fromJson(
            json['deviceSimExpirationDate'] as Map<String, dynamic>),
    sharing: json['sharing'] == null
        ? null
        : UserDevices.fromJson(json['sharing'] as Map<String, dynamic>),
    checklistTemplate: json['checklistTemplate'] == null
        ? null
        : UserDevices.fromJson(
            json['checklistTemplate'] as Map<String, dynamic>),
    checklist: json['checklist'] == null
        ? null
        : UserDevices.fromJson(json['checklist'] as Map<String, dynamic>),
    checklistActivity: json['checklistActivity'] == null
        ? null
        : UserDevices.fromJson(
            json['checklistActivity'] as Map<String, dynamic>),
    checklistQrCode: json['checklistQrCode'] == null
        ? null
        : UserDevices.fromJson(json['checklistQrCode'] as Map<String, dynamic>),
    checklistQrPreStartOnly: json['checklistQrPreStartOnly'] == null
        ? null
        : UserDevices.fromJson(
            json['checklistQrPreStartOnly'] as Map<String, dynamic>),
    deviceConfiguration: json['deviceConfiguration'] == null
        ? null
        : UserDevices.fromJson(
            json['deviceConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PermissionsToJson(Permissions instance) =>
    <String, dynamic>{
      'devices': instance.devices,
      'alerts': instance.alerts,
      'geofences': instance.geofences,
      'routes': instance.routes,
      'poi': instance.poi,
      'reports': instance.reports,
      'smsGateway': instance.smsGateway,
      'sendCommand': instance.sendCommand,
      'history': instance.history,
      'maintenance': instance.maintenance,
      'camera': instance.camera,
      'deviceCamera': instance.deviceCamera,
      'tasks': instance.tasks,
      'chat': instance.chat,
      'deviceImei': instance.deviceImei,
      'deviceSimNumber': instance.deviceSimNumber,
      'deviceForward': instance.deviceForward,
      'deviceProtocol': instance.deviceProtocol,
      'deviceActivationDate': instance.deviceActivationDate,
      'deviceExpirationDate': instance.deviceExpirationDate,
      'deviceSimActivationDate': instance.deviceSimActivationDate,
      'deviceSimExpirationDate': instance.deviceSimExpirationDate,
      'sharing': instance.sharing,
      'checklistTemplate': instance.checklistTemplate,
      'checklist': instance.checklist,
      'checklistActivity': instance.checklistActivity,
      'checklistQrCode': instance.checklistQrCode,
      'checklistQrPreStartOnly': instance.checklistQrPreStartOnly,
      'deviceConfiguration': instance.deviceConfiguration,
    };

UserDevices _$UserDevicesFromJson(Map<String, dynamic> json) {
  return UserDevices(
    view: json['view'] as bool,
    edit: json['edit'] as bool,
    remove: json['remove'] as bool,
  );
}

Map<String, dynamic> _$UserDevicesToJson(UserDevices instance) =>
    <String, dynamic>{
      'view': instance.view,
      'edit': instance.edit,
      'remove': instance.remove,
    };
