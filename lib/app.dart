import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/size_config.dart';
import 'features/GpsLvn/presentation/pages/home_screen.dart';
import 'features/login/domain/usecases/get_status.dart';
import 'features/login/presentation/blocs/authentication/authentication_bloc.dart';
import 'features/login/presentation/pages/home_page.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'features/login/presentation/pages/splash_page.dart';
import 'injection_container.dart';
import 'theme.dart';

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<AuthenticationBloc>(),
        ),
      ],
      child: AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        //Locale("ar", "AE"),
        Locale("en", "USA"),
      ],
      theme: AppTheme2.themeData(),
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
         SizeConfig.init(context);
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomeScreen.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
    
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         // builder: DevicePreview.appBuilder,
//         localizationsDelegates: [
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//           DefaultCupertinoLocalizations.delegate
//         ],
//         supportedLocales: [
//           //Locale("ar", "AE"),
//           Locale("en", "USA"),
//         ],
//         theme: AppTheme2.themeData(),
//         debugShowCheckedModeBanner: false,
//         home: MultiBlocProvider(
//           providers: [

//             BlocProvider<DevicesBloc>(create: (context) => sl<DevicesBloc>()),
//           ],
//           child: SplashScreen(),
//         ));
//   }
// }
