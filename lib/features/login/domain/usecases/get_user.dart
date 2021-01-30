import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gpsLVN/core/errors/failures.dart';
import 'package:gpsLVN/core/usecases/usecase.dart';
import 'package:gpsLVN/features/login/domain/entities/user.dart';
import 'package:gpsLVN/features/login/domain/repositories/user_repository.dart';
import 'package:meta/meta.dart';

class GetUser implements UseCase<User, ParamsUser> {
 final UserRepository repository;
 const GetUser(this.repository);
  @override
  Future<Either<Failure, User>> call(ParamsUser params) async {
    return await repository.getUser(params.username, params.password);
  }
}
class ParamsUser extends Equatable {
  final String username;
  final String password;

  const ParamsUser({@required this.username, @required this.password});

  @override
  List<Object> get props => [username, password];
}
