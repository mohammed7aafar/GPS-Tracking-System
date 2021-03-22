import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/GpsLvn/data/datasources/devices_local_data_source.dart';
import 'features/GpsLvn/data/datasources/devices_remote_data_source.dart';
import 'features/GpsLvn/data/repositories/devices_repository_impl.dart';
import 'features/GpsLvn/domain/repositories/devices_repository.dart';
import 'features/GpsLvn/domain/usecases/get_devices.dart';
import 'features/GpsLvn/presentation/blocs/animatedIconCubit/animatedicon_cubit.dart';
import 'features/GpsLvn/presentation/blocs/devices/devices_bloc.dart';
import 'features/GpsLvn/presentation/blocs/expansionToggle/expansiontoggle_cubit.dart';
import 'features/GpsLvn/presentation/blocs/groupIcon/groupicon_cubit.dart';
import 'features/GpsLvn/presentation/blocs/showTrack/showtrack_cubit.dart';
import 'features/GpsLvn/presentation/blocs/tab/tab_bloc.dart';
import 'features/GpsLvn/presentation/blocs/toggleGeofence/togglegeofence_cubit.dart';
import 'features/GpsLvn/presentation/blocs/toggleGroupUnits/togglegroupunits_cubit.dart';
import 'features/GpsLvn/presentation/blocs/toggleMap/togglemap_cubit.dart';
import 'features/GpsLvn/presentation/blocs/toggleRoute/toggleroute_cubit.dart';
import 'features/GpsLvn/presentation/blocs/toggleTrack/toggletrack_cubit.dart';
import 'features/GpsLvn/presentation/blocs/unitGroups/unitgroups_cubit.dart';
import 'features/login/data/datasources/user_local_data_source.dart';
import 'features/login/data/datasources/user_remote_data_source.dart';
import 'features/login/data/repositories/user_repository_impl.dart';
import 'features/login/domain/repositories/user_repository.dart';
import 'features/login/domain/usecases/dispose.dart';
import 'features/login/domain/usecases/get_status.dart';
import 'features/login/domain/usecases/get_user.dart';
import 'features/login/domain/usecases/has_token.dart';
import 'features/login/domain/usecases/log_out.dart';
import 'features/login/presentation/blocs/authentication/authentication_bloc.dart';
import 'features/login/presentation/blocs/login/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features  - GPS LVN

//Blocs

  sl.registerFactory(() => DevicesBloc(devices: sl()));

  sl.registerFactory(() => GroupiconCubit());
  sl.registerFactory(() => UnitgroupsCubit());
  sl.registerFactory(() => AnimatediconCubit());
  sl.registerFactory(() => TabBloc());
  //sl.registerFactory(() => SplashBloc(devicesBloc: sl()));
  sl.registerFactory(() => ToggletrackCubit());
  sl.registerFactory(() => ShowtrackCubit());
  sl.registerFactory(() => TogglegeofenceCubit());
  sl.registerFactory(() => TogglerouteCubit());
  sl.registerFactory(() => ExpansiontoggleCubit());
  sl.registerFactory(() => TogglemapCubit());
  sl.registerFactory(() => TogglegroupunitsCubit());
  
  

//  sl.registerFactory(() => null)

//usecases

  sl.registerLazySingleton(() => GetDevices(sl()));

//repositories

  sl.registerLazySingleton<DevicesRepository>(() => DevicesRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

//Data Sources

  sl.registerLazySingleton<DevicesRemoteDataSource>(
    () => DevicesRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<DevicesLocalDataSource>(
    () => DevicesLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Features Login

  // final storage = new FlutterSecureStorage();
  // String token = await storage.read(key: "token");

  //Blocs
  sl.registerFactory(() => AuthenticationBloc(
      dispose: sl(),
      getStatus: sl(),
      logOut: sl(),
      user: sl(),
      hasToken: sl()));
  sl.registerFactory(() => LoginBloc(user: sl()));

  // usecases
  sl.registerLazySingleton(() => GetUser(sl()));
  sl.registerLazySingleton(() => LogOut(sl()));
  sl.registerLazySingleton(() => GetStatus(sl()));
  sl.registerLazySingleton(() => DisposeUseCase(sl()));
  sl.registerLazySingleton(() => HasToken(sl()));
  //repositories
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
      flutterSecureStorage: sl()));
  //Data Sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sharedPreferences: sl()),
  );

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External

  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => CachedNetworkImageProvider);
  sl.registerLazySingleton(() => FlutterSecureStorage());
}
