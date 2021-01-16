import 'package:bloc/bloc.dart';


class GeofenceCubit extends Cubit<bool> {
  GeofenceCubit() : super(false);


  showGeofenceDetails()=> emit(!state);
  
}
