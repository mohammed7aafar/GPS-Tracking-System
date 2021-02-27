import 'package:bloc/bloc.dart';


class ExpansiontoggleCubit extends Cubit<bool> {
  ExpansiontoggleCubit() : super(false);

  void expandOrCollapse()=> emit(!state);
}
