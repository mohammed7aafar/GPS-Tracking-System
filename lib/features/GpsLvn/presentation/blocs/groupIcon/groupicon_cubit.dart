import 'package:bloc/bloc.dart';

class GroupiconCubit extends Cubit<bool> {
  GroupiconCubit() : super(false);


expandOrCollapse()=> emit(!state);

}
