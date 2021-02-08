part of 'devices_bloc.dart';

abstract class DevicesEvent extends Equatable {
  const DevicesEvent();

  @override
  List<Object> get props => [];
}



class GetDevicesData extends DevicesEvent{

final String token;
final String lang;

const  GetDevicesData(this.token, this.lang);

 @override
  List<Object> get props => [token,lang];
}



