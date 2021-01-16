import 'package:bloc/bloc.dart';

class ToggletrackCubit extends Cubit<bool> {
  ToggletrackCubit() : super(false);

  void toggleTrackTab() => emit(!state);

  void toggleTrackTabFromMapTab() {

    if(!state) return;
    else emit(!state);
  }
}
