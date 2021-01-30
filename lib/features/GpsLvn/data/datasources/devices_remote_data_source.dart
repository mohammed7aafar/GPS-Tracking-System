import 'dart:convert';
import 'package:gpsLVN/core/errors/exceptions.dart';
import 'package:gpsLVN/core/utils/api_refrence.dart';
import 'package:gpsLVN/features/GpsLvn/data/models/devices_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class DevicesRemoteDataSource {
  Future<DevicesModel> getDevices(String token, String lang);
}

class DevicesRemoteDataSourceImpl implements DevicesRemoteDataSource {
  final http.Client client;

  DevicesRemoteDataSourceImpl({@required this.client});

  @override
  Future<DevicesModel> getDevices(String token, String lang) async {
    final res = await client.get(
      Uri.encodeFull(
      ApiRefrence.getDevices(token, lang),),
     headers: {'Content-Type': 'application/json'},
    );

    if (res.statusCode == 200) {
   
      
      return DevicesModel.fromJson(json.decode(utf8.decode(res.bodyBytes)));
    } 
   
    else {
      throw ServerException();
    }
  }
}
