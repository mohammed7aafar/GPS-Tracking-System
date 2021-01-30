import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/bloc/bloc_observer.dart';
import 'core/constants/constants.dart';
import 'features/GpsLvn/presentation/blocs/devices/devices_bloc.dart';
import 'features/GpsLvn/presentation/blocs/splash/splash_bloc.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    App(),
  );
}
