part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
}

class ItemsAdded extends MapEvent {
  final List<Item> items;

  const ItemsAdded(this.items);

  @override
  List<Object> get props => [items];

  // @override
  // String toString() => 'ItemsAdded { todos: $items }';
}


class GroupsAdded extends MapEvent {
  final List<Group> groups;

  const GroupsAdded(this.groups);

  @override
  List<Object> get props => [groups];

  // @override
  // String toString() => 'ItemsAdded { todos: $items }';
}
