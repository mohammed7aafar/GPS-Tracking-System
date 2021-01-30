import 'package:gpsLVN/features/login/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  UserModel({
    int status,
    String userApiHash,
    Permissions permissions,
  })  : 
        assert(status != null),
        assert(userApiHash != null),
        assert(permissions != null),
        super(permissions: permissions, status: status, userApiHash: userApiHash);
  factory UserModel.fromJson(Map<String, dynamic> json) =>  _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
