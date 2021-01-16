import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/size_config.dart';
import '../blocs/splash/splash_bloc.dart';
import '../widgets/splash/splash_widget.dart';
import 'login_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    SizeConfig.init(context);

    return buildBlocBuilder();

    // SplashWidget()
  }

  BlocBuilder<SplashBloc, SplashState> buildBlocBuilder() {
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
    if ((state is SplashInitial) || (state is SplashLoading)) {
      return SplashWidget();
    } else if (state is SplashLoaded) {
      return LoginScreen();
    }
  });
  }
}