import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'features/GpsLvn/presentation/blocs/tab/tab_bloc.dart';
import 'features/GpsLvn/presentation/pages/home_screen.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     // builder: DevicePreview.appBuilder,
       localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
       supportedLocales: [
        //Locale("ar", "AE"),
        Locale("en", "USA"),
      ],
      theme: AppTheme2.themeData(),
      debugShowCheckedModeBanner: false,
      home:
      BlocProvider<TabBloc>(
            create: (context) => TabBloc(),
            child: HomeScreen(),
          ),
      
       
    );
  }
}








