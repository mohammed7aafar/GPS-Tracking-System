// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    status: json['status'] as int,
    userApiHash: json['userApiHash'] as String,
    permissions: json['permissions'] == null
        ? null
        : Permissions.fromJson(json['permissions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'status': instance.status,
      'userApiHash': instance.userApiHash,
      'permissions': instance.permissions,
    };
