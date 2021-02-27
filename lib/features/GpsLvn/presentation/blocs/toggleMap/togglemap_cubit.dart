import 'package:bloc/bloc.dart';


class TogglemapCubit extends Cubit<bool> {
  TogglemapCubit() : super(false);

  dragOrDrop()=> emit(!state);
}
