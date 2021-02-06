part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class ItemsLoadInProgress extends MapState {}

// class MarkersLoadSuccess extends MapState {
//   final Map<MarkerId, Marker> markers;

//   const MarkersLoadSuccess(
//     this.markers,
//   );

//   @override
//   List<Object> get props => [markers];

//   @override
//   String toString() {
//     return 'MarkersLoadSuccess { Markers: $markers }';
//   }
// }


class ItemsLoadSuccess extends MapState {
  final List<Item> items;
  final List<Group> groups;

  const ItemsLoadSuccess(
    this.items,
    this.groups
  );

  @override
  List<Object> get props => [items,groups];

  @override
  String toString() {
    return 'ItemsLoadSuccess { items: $items }';
  }
}
