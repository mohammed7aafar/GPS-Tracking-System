import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:gpsLVN/core/errors/failures.dart';
import 'package:gpsLVN/features/login/data/models/password.dart';
import 'package:gpsLVN/features/login/data/models/username.dart';
import 'package:gpsLVN/features/login/domain/entities/user.dart';
import 'package:gpsLVN/features/login/domain/usecases/get_user.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required this.user,
  })  : assert(user != null),
        super(const LoginState());

  final GetUser user;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginUsernameChanged) {
      yield _mapUsernameChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    }
  }

  LoginState _mapUsernameChangedToState(
    LoginUsernameChanged event,
    LoginState state,
  ) {
    final username = Username.dirty(event.username);
    return state.copyWith(
      username: username,
      status: Formz.validate([state.password, username]),
    );
  }

  LoginState _mapPasswordChangedToState(
    LoginPasswordChanged event,
    LoginState state,
  ) {
    final password = Password.dirty(event.password);
    return state.copyWith(
      password: password,
      status: Formz.validate([password, state.username]),
    );
  }

  Stream<LoginState> _mapLoginSubmittedToState(
    LoginSubmitted event,
    LoginState state,
  ) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        final failureOrUser = await user(ParamsUser(
          username: state.username.value,
          password: state.password.value,
        ));

        yield* _eitherLoadedOrErrorState(failureOrUser);
      } on Exception catch (_) {
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }

  Stream<LoginState> _eitherLoadedOrErrorState(
    Either<Failure, User> failureOrUser,
  ) async* {
    yield failureOrUser.fold(
      (failure) => state.copyWith(status: FormzStatus.submissionFailure),
      (user) => user == null
          ? state.copyWith(status: FormzStatus.submissionFailure)
          : state.copyWith(status: FormzStatus.submissionSuccess),
    );
  }
}
