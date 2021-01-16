import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gpsLVN/core/errors/failures.dart';
import 'package:gpsLVN/core/usecases/usecase.dart';
import 'package:gpsLVN/features/GpsLvn/domain/entities/devices.dart';
import 'package:gpsLVN/features/GpsLvn/domain/repositories/devices_repository.dart';
import 'package:meta/meta.dart';

class GetDevices implements UseCase<Devices, ParamsDevices> {
  final DevicesRepository repository;

  GetDevices(this.repository);

  @override
  Future<Either<Failure, Devices>> call(ParamsDevices params) async {
    return await repository.getDevices(params.token, params.lang);
  }
}

class ParamsDevices extends Equatable {
  final String token;
  final String lang;

  const ParamsDevices({@required this.token, @required this.lang});

  @override
  List<Object> get props => [token, lang];
}
