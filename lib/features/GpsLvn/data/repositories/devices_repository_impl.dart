import 'package:gpsLVN/core/errors/exceptions.dart';
import 'package:gpsLVN/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:gpsLVN/core/network/network_info.dart';
import 'package:gpsLVN/features/GpsLvn/data/datasources/devices_local_data_source.dart';
import 'package:gpsLVN/features/GpsLvn/data/datasources/devices_remote_data_source.dart';
import 'package:gpsLVN/features/GpsLvn/domain/entities/devices.dart';
import 'package:gpsLVN/features/GpsLvn/domain/repositories/devices_repository.dart';
import 'package:meta/meta.dart';

class DevicesRepositoryImpl implements DevicesRepository {
  final DevicesRemoteDataSource remoteDataSource;
  final DevicesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  DevicesRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Devices>> getDevices(String token, String lang) async {
    if (await networkInfo.isConnected) {
      try {
       
        final remoteDevices = await remoteDataSource.getDevices(token, lang);
        localDataSource.cacheDevices(remoteDevices);

        //! Right() means the right side of Future

        return Right(remoteDevices);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localDevices = await localDataSource.getLastDevices();
        return Right(localDevices);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
