import 'package:dartz/dartz.dart';
import 'package:gpsLVN/core/errors/failures.dart';
import 'package:gpsLVN/features/GpsLvn/domain/entities/devices.dart';

abstract class DevicesRepository {
  Future<Either<Failure, Devices>> getDevices(String token, String lang);
}
