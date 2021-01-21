part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class ItemsLoadInProgress extends MapState {}

class ItemsLoadSuccess extends MapState {
  final List<Item> items;

  const ItemsLoadSuccess(
    this.items,
  );

  @override
  List<Object> get props => [items];

  @override
  String toString() {
    return 'ItemsLoadSuccess { itemsTodos: $items }';
  }
}
