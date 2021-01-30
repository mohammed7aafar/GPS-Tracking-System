import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:gpsLVN/features/login/presentation/blocs/login/login_bloc.dart';

import '../../../../injection_container.dart';
import '../../../../theme.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme2.primaryColor,
      //appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) => sl<LoginBloc>(),
          child: LoginForm(),
        ),
      ),
    );
  }
}
