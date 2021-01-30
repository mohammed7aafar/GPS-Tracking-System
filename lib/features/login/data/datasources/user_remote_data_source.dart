import 'dart:convert';
import 'package:gpsLVN/core/errors/exceptions.dart';
import 'package:gpsLVN/core/utils/api_refrence.dart';
import 'package:gpsLVN/features/login/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser(String username, String password);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({@required this.client});

  @override
  Future<UserModel> getUser(String username, String password) async {
    var map = new Map<String, dynamic>();
    map['email'] = username;
    map['password'] = password;

    final res = await client.post(
      ApiRefrence.getUser(username, password),
      body: map,
    );

    if (res.statusCode == 200) {  
      //print(res.body);
      //final x = UserModel.fromJson(json.decode(res.body));
     // print(x.userApiHash);
      return UserModel.fromJson(json.decode(res.body));
    } else if (res.statusCode == 401) {
      return null;
    } else {
      throw ServerException();
    }
  }
}
