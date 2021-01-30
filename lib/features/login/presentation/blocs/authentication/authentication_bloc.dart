import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gpsLVN/core/usecases/usecase.dart';
import 'package:gpsLVN/features/login/domain/usecases/dispose.dart';
import 'package:gpsLVN/features/login/domain/usecases/get_status.dart';
import 'package:gpsLVN/features/login/domain/usecases/get_user.dart';
import 'package:gpsLVN/features/login/domain/usecases/has_token.dart';
import 'package:gpsLVN/features/login/domain/usecases/log_out.dart';
import 'package:meta/meta.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    @required this.logOut,
    @required this.dispose,
    @required this.user,
    @required this.getStatus,
    @required this.hasToken,
  })  : assert(getStatus != null),
        assert(dispose != null),
        assert(logOut != null),
        assert(user != null),
        super(const AuthenticationState.unknown()) {
         hasToken(NoParams());

    _authenticationStatusSubscription = getStatus(NoParams()).listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  final GetStatus getStatus;
  final LogOut logOut;
  final DisposeUseCase dispose;
  final GetUser user;
  final HasToken hasToken;
  StreamSubscription<AuthenticationStatus> _authenticationStatusSubscription;


  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStatusChanged) {
      yield await _mapAuthenticationStatusChangedToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      logOut(NoParams());
    }
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription?.cancel();
    dispose(NoParams());
    return super.close();
  }

  Future<AuthenticationState> _mapAuthenticationStatusChangedToState(
    AuthenticationStatusChanged event,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return const AuthenticationState.unauthenticated();
      case AuthenticationStatus.authenticated:
        return user != null
            ? AuthenticationState.authenticated()
            : const AuthenticationState.unauthenticated();
      default:
        return const AuthenticationState.unknown();
    }
  }
}
