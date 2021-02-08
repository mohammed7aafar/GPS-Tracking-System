import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gpsLVN/features/login/domain/usecases/has_token.dart';
import 'package:meta/meta.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/devices.dart';
import '../../../domain/usecases/get_devices.dart';
part 'devices_event.dart';
part 'devices_state.dart';

class DevicesBloc extends Bloc<DevicesEvent, DevicesState> {
  final GetDevices devices;

  DevicesBloc({@required this.devices})
      : assert(devices != null),
        super(DevicesInitial());

  @override
  Stream<DevicesState> mapEventToState(
    DevicesEvent event,
  ) async* {
    if (event is GetDevicesData) {
      yield DevicesDataLoading();

      final failureOrDevices =
          await devices(ParamsDevices(token: event.token, lang: event.lang));
      yield* _eitherLoadedOrErrorState(failureOrDevices);
    }
  }



  Stream<DevicesState> _eitherLoadedOrErrorState(
    Either<Failure, Devices> failureOrDevices,
  ) async* {
    yield failureOrDevices.fold(
      (failure) => DevicesDataError(message: _mapFailureToMessage(failure)),
      (devices) => DevicesDataLoaded(devices: devices),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
