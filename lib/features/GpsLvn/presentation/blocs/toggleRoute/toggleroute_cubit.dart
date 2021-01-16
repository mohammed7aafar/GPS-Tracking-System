import 'package:bloc/bloc.dart';

class TogglerouteCubit extends Cubit<bool> {
  TogglerouteCubit() : super(false);


   void toggleRoute() => emit(!state);

  void toggleRouteFromMapTab() {

    if(!state) return;
    else emit(!state);
  }
}
