import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:gpsLVN/features/login/presentation/blocs/authentication/authentication_bloc.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

final storage = new FlutterSecureStorage();
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'UserID: ${context.bloc<AuthenticationBloc>().state.status}',
            ),
            RaisedButton(
              child: const Text('Logout'),
              onPressed: () async{
                 await storage.delete(key: "token");
                context.bloc<AuthenticationBloc>().add(AuthenticationLogoutRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}
