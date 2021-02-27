part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
    @override
  
  List<Object> get props => [];

}

class ItemsAdded extends MapEvent {
  final List<Item> items;

  const ItemsAdded(this.items);

  @override
  List<Object> get props => [items];

  // @override
  // String toString() => 'ItemsAdded { todos: $items }';
}


class ItemsUpdated extends MapEvent {
  final Item item;
  const ItemsUpdated(this.item);

  @override
  List<Object> get props => [item];

  // @override
  // String toString() => 'ItemsUpdated { ItemsUpdated: ${item.deviceData.id} }';
}

class ToggleAll extends MapEvent {}




