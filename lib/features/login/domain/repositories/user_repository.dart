import 'package:dartz/dartz.dart';
import 'package:gpsLVN/core/errors/failures.dart';
import 'package:gpsLVN/features/login/domain/entities/user.dart';
import 'package:gpsLVN/features/login/domain/usecases/get_status.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser(String username, String password);
  Stream<AuthenticationStatus> getStatus();
  void logout();
  void dispose();
  Future<void> hasToken();
}
