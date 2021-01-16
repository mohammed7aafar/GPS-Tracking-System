import 'package:bloc/bloc.dart';

class ShowtrackCubit extends Cubit<bool> {
  ShowtrackCubit() : super(false);



  void showTrack() => emit(!state);

  
}
