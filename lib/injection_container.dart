import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
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
import 'features/GpsLvn/presentation/blocs/groupIcon/groupicon_cubit.dart';
import 'features/GpsLvn/presentation/blocs/showTrack/showtrack_cubit.dart';
import 'features/GpsLvn/presentation/blocs/splash/splash_bloc.dart';
import 'features/GpsLvn/presentation/blocs/tab/tab_bloc.dart';
import 'features/GpsLvn/presentation/blocs/toggleGeofence/togglegeofence_cubit.dart';
import 'features/GpsLvn/presentation/blocs/toggleRoute/toggleroute_cubit.dart';
import 'features/GpsLvn/presentation/blocs/toggleTrack/toggletrack_cubit.dart';
import 'features/GpsLvn/presentation/blocs/unitGroups/unitgroups_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features  - GPS LVN

//Blocs

  sl.registerFactory(() => DevicesBloc(devices: sl()));

  sl.registerFactory(() => GroupiconCubit());
  sl.registerFactory(() => UnitgroupsCubit());
  sl.registerFactory(() => AnimatediconCubit());
  sl.registerFactory(() => TabBloc());
  sl.registerFactory(() => SplashBloc(devicesBloc: sl()));
  sl.registerFactory(() => ToggletrackCubit());
  sl.registerFactory(() => ShowtrackCubit());
  sl.registerFactory(() => TogglegeofenceCubit());
  sl.registerFactory(() => TogglerouteCubit());

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

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External

  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => CachedNetworkImageProvider);
}
