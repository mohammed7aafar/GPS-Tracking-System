import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gpsLVN/features/GpsLvn/domain/entities/devices.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/devices/devices_bloc.dart';

part 'map_event.dart';
part 'map_state.dart';

class FlutterMapBloc extends Bloc<MapEvent, MapState> {
  final DevicesBloc devicesBloc;
  StreamSubscription devicesSubscription;
  List<Item> items = [];

  FlutterMapBloc({this.devicesBloc}) : super(ItemsLoadInProgress()) {
    devicesSubscription = devicesBloc.listen((state) {
      print(state);
      if (state is DevicesDataLoaded) {
        for (var item
            in (devicesBloc.state as DevicesDataLoaded).devices.groups) {
          items.addAll(item.items);
        }
        //print(items.length);
        // print(state.devices.groups.length);
        add(ItemsAdded(items));
      }
    });
  }

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is ItemsAdded) {
      if (devicesBloc.state is DevicesDataLoaded) {
        yield ItemsLoadSuccess(items);
      }
    }
  }

  @override
  Future<void> close() {
    devicesSubscription.cancel();
    return super.close();
  }
}
