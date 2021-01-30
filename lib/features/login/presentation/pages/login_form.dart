import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpsLVN/core/utils/size_config.dart';
import 'package:gpsLVN/features/login/presentation/blocs/login/login_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../theme.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure'),),
            );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(),
          _UsernameInput(),
          const Padding(padding: EdgeInsets.all(12)),
          _PasswordInput(),
          const Padding(padding: EdgeInsets.all(12)),
          _SelectServerContainer(),
          const Padding(padding: EdgeInsets.all(12)),
          _RememberMeCheckBox(),
          const Padding(padding: EdgeInsets.all(12)),
          _LoginButton(),
          const Padding(padding: EdgeInsets.all(12)),
          _ForgetPasswordText(),
          Spacer(),
          _FooterText(),
        ],
      ),
    );
  }
}

class _FooterText extends StatelessWidget {
  const _FooterText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text("Powered by GPS LVN",
            style: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: SizeConfig.screenWidth / 25,
                color: AppTheme2.primaryColor18)));
  }
}

class _ForgetPasswordText extends StatelessWidget {
  const _ForgetPasswordText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Forgot Password?",
          style: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: SizeConfig.screenWidth / 25,
                color: AppTheme2.territoryColor,
              )),
    );
  }
}

class _SelectServerContainer extends StatelessWidget {
  const _SelectServerContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(8),
        color: AppTheme2.primaryColor,
        child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onTap: () {},
            child: Container(
                height: SizeConfig.screenWidth / 8,
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: AppTheme2.primaryColor18, width: 0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Ionicons.server_outline,
                          color: AppTheme2.primaryColor18,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "USA",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: SizeConfig.screenWidth / 30,
                              color: AppTheme2.primaryColor18),
                        ),
                      ],
                    ),
                    IconButton(
                        padding: EdgeInsets.symmetric(vertical: 1),
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: SizeConfig.screenWidth / 15,
                          color: AppTheme2.primaryColor18,
                        ),
                        onPressed: () {
                          // buildBottomSheet(context);
                        })
                  ],
                ))));
  }
}

class _RememberMeCheckBox extends StatelessWidget {
  const _RememberMeCheckBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (bool value) {
            //loginController.rememberMe(value);
          },
          activeColor: AppTheme2.territoryColor,
          checkColor: AppTheme2.primaryColor,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Remember me",
          style: Theme.of(context).textTheme.headline3.copyWith(
              fontSize: SizeConfig.screenWidth / 30,
              color: AppTheme2.primaryColor18),
        ),
      ],
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          onChanged: (username) =>
              context.bloc<LoginBloc>().add(LoginUsernameChanged(username)),
          style: Theme.of(context).textTheme.headline6.copyWith(
              fontSize: SizeConfig.screenWidth / 30,
              color: AppTheme2.whiteColor),
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Ionicons.person_outline,
                color: AppTheme2.primaryColor18,
              ),
              labelText: 'username',
              errorText: state.username.invalid ? 'invalid username' : null,
              labelStyle: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: SizeConfig.screenWidth / 30,
                  color: AppTheme2.primaryColor18),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme2.primaryColor18,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppTheme2.primaryColor18, width: 0.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppTheme2.primaryColor18, width: 0.5),
                  borderRadius: BorderRadius.circular(8.0)),
              contentPadding: EdgeInsets.all(15)),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          onChanged: (password) =>
              context.bloc<LoginBloc>().add(LoginPasswordChanged(password)),
          style: Theme.of(context).textTheme.headline6.copyWith(
              fontSize: SizeConfig.screenWidth / 30,
              color: AppTheme2.whiteColor),
          obscureText: true,
          decoration: InputDecoration(
              prefixIcon: Icon(
                Ionicons.key_outline,
                color: AppTheme2.primaryColor18,
              ),
              labelText: 'Password',
              errorText: state.password.invalid ? 'invalid Password' : null,
              labelStyle: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: SizeConfig.screenWidth / 30,
                  color: AppTheme2.primaryColor18),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme2.primaryColor18,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppTheme2.primaryColor18, width: 0.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppTheme2.primaryColor18, width: 0.5),
                  borderRadius: BorderRadius.circular(8.0)),
              contentPadding: EdgeInsets.all(15)),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : SizedBox(
                height: SizeConfig.screenWidth / 8,
                width: double.infinity,
                child: RaisedButton(
                  elevation: 0,
                  disabledColor: AppTheme2.primaryColor20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: AppTheme2.territoryColor,
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        fontSize: SizeConfig.screenWidth / 25,
                        color: AppTheme2.whiteColor),
                  ),
                  onPressed: state.status.isValidated
                      ? () {
                          context.bloc<LoginBloc>().add(const LoginSubmitted());
                        }
                      : null,
                ));
      },
    );
  }
}
