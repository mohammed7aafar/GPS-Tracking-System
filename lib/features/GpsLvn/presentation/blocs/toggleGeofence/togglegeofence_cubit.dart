import 'package:bloc/bloc.dart';


class TogglegeofenceCubit extends Cubit<bool> {
  TogglegeofenceCubit() : super(false);


void toggleGeofence() => emit(!state);

  void toggleGeofenceFromMapTab() {

    if(!state) return;
    else emit(!state);
  }

}
