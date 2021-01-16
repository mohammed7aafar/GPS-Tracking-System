import 'dart:convert';

import 'package:gpsLVN/core/constants/constants.dart';
import 'package:gpsLVN/core/errors/exceptions.dart';
import 'package:gpsLVN/features/GpsLvn/data/models/devices_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class DevicesLocalDataSource {
  /// Gets the cached [DevicesModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<DevicesModel> getLastDevices();

  Future<void> cacheDevices(DevicesModel devicesToCache);
}

class DevicesLocalDataSourceImpl implements DevicesLocalDataSource {
  final SharedPreferences sharedPreferences;

  DevicesLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheDevices(DevicesModel devicesToCache) {
    return sharedPreferences.setString(
      CACHED_DEVICES,
      json.encode(devicesToCache.toJson()),
    );
  }

  @override
  Future<DevicesModel> getLastDevices() {
    final jsonString = sharedPreferences.getString(CACHED_DEVICES);
    if (jsonString != null) {
      return Future.value(DevicesModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
