import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial());

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is NavigateToHomePage) {
      yield SplashLoading();

      await Future.delayed(Duration(seconds: 2));

// In this state we can load the HOME PAGE
      yield SplashLoaded();
    }
  }
}