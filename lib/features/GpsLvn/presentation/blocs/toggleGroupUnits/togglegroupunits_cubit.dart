import 'package:bloc/bloc.dart';

class TogglegroupunitsCubit extends Cubit<bool> {
  TogglegroupunitsCubit() : super(false);
   
     toggleGroupUnitsBottomSheet() => emit(!state);

}
