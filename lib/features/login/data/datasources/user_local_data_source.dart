import 'dart:convert';

import 'package:gpsLVN/core/constants/constants.dart';
import 'package:gpsLVN/core/errors/exceptions.dart';
import 'package:gpsLVN/features/GpsLvn/data/models/devices_model.dart';
import 'package:gpsLVN/features/login/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';




abstract class UserLocalDataSource {
  /// Gets the cached [UserModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<UserModel> getLastUser();

  Future<void> cacheUser(UserModel devicesToCache);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheUser(UserModel userToCache) {
    return sharedPreferences.setString(
      CACHED_USER,
      json.encode(userToCache.toJson()),
    );
  }

  @override
  Future<UserModel> getLastUser() {
    final jsonString = sharedPreferences.getString(CACHED_USER);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
