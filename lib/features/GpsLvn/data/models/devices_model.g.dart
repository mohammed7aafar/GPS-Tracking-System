// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevicesModel _$DevicesModelFromJson(Map<String, dynamic> json) {
  return DevicesModel(
    groups: (json['groups'] as List)
        ?.map(
            (e) => e == null ? null : Group.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$DevicesModelToJson(DevicesModel instance) =>
    <String, dynamic>{
      'groups': instance.groups,
      'user': instance.user,
      'status': instance.status,
    };
