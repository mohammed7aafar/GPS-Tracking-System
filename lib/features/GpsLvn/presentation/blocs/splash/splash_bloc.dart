import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gpsLVN/features/GpsLvn/domain/entities/devices.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/devices/devices_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final DevicesBloc devicesBloc;
  StreamSubscription devicesSubcription;
  List<Item> items = [];

  SplashBloc({this.devicesBloc})
      : super(
          devicesBloc.state is DevicesDataLoaded
              ? SplashLoaded()
              : SplashLoading(),
        ) {
    devicesSubcription = devicesBloc.listen((state) {
      if (state is DevicesDataLoaded) {
        add(NavigateToHomePage());
      }
    });
  }

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is NavigateToHomePage) {
      if (devicesBloc.state is DevicesDataLoaded) {
        await Future.delayed(Duration(seconds: 3));
        yield SplashLoaded();
      }
    }
  }

  @override
  Future<void> close() {
    devicesSubcription.cancel();
    return super.close();
  }
}
