import 'package:bloc/bloc.dart';


class UnitgroupsCubit extends Cubit<bool> {
  UnitgroupsCubit() : super(false);


  showGroupsOrUnits()=> emit(!state);

}
