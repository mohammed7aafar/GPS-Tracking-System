part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
  });

  //!  constructor never be called at all this._() .
  const AuthenticationState.unknown() : this._();
  
  const AuthenticationState.authenticated(): this._(status: AuthenticationStatus.authenticated);

  const AuthenticationState.unauthenticated() : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  
  @override
  List<Object> get props => [status];
}
