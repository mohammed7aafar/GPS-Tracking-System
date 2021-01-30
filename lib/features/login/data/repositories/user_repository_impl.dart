import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gpsLVN/features/login/domain/usecases/get_status.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_data_source.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final FlutterSecureStorage flutterSecureStorage;

  UserRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
    @required this.flutterSecureStorage,
  });

  StreamController<AuthenticationStatus> _controller =  StreamController<AuthenticationStatus>();

  @override
  Future<Either<Failure, User>> getUser(
      String username, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.getUser(username, password);
        if (remoteUser != null) {
          await flutterSecureStorage.write(
              key: "token", value: "${remoteUser.userApiHash}");
          _controller.add(AuthenticationStatus.authenticated);
          localDataSource.cacheUser(remoteUser);
        }
        return Right(remoteUser);

        //! Right() means the right side of Future

      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localUser = await localDataSource.getLastUser();
        return Right(localUser);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Stream<AuthenticationStatus> getStatus() async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  void logout() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  @override
  void dispose() => _controller.close();

  @override
  Future<void> hasToken() async {
    final token = await flutterSecureStorage.read(key: "token");
    print(token);
    if (token != null) {
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }
}
