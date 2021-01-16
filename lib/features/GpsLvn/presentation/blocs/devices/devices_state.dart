part of 'devices_bloc.dart';

abstract class DevicesState extends Equatable {
  const DevicesState();

  @override
  List<Object> get props => [];
}

class DevicesInitial extends DevicesState {}

class DevicesDataLoading extends DevicesState {}

class DevicesDataLoaded extends DevicesState {
  final Devices devices;

  const DevicesDataLoaded({@required this.devices});

  @override
  List<Object> get props => [devices];
}






class DevicesDataError extends DevicesState {
  final String message;

  DevicesDataError({@required this.message});

  @override
  List<Object> get props => [message];
}
