import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
      // print(state);
      if (state is DevicesDataLoaded) {
        for (var item
            in (devicesBloc.state as DevicesDataLoaded).devices.groups) {
          items.addAll(item.items);
        }

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
        yield ItemsLoadSuccess(
            items, (devicesBloc.state as DevicesDataLoaded).devices.groups);
      }
    } else if (event is ItemsUpdated) {
      if (devicesBloc.state is DevicesDataLoaded) {
      yield* _mapItemsUpdatedToState(event);
      }
    }
  }

  Stream<MapState> _mapItemsUpdatedToState(ItemsUpdated event) async* {
    if (state is ItemsLoadSuccess) {
      final List<Item> updatedItems = (state as ItemsLoadSuccess).items.map((item) {
        return item.deviceData.id == event.item.deviceData.id ? event.item : item;
      }).toList();
      yield ItemsLoadSuccess(updatedItems,
          (devicesBloc.state as DevicesDataLoaded).devices.groups);
    }
  }

  @override
  Future<void> close() {
    devicesSubscription.cancel();
    return super.close();
  }
}
