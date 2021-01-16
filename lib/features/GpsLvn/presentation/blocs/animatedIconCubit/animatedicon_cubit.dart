import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';

class AnimatediconCubit extends Cubit<bool> {
  AnimatediconCubit() : super(false);

  void expandOrCollapse() => emit(!state);

  
  
}
