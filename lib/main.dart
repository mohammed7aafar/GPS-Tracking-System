import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/bloc/bloc_observer.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = SimpleBlocObserver();
  //SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(
      // DevicePreview(builder:
      //  (context)=>
  MyApp());
}
