import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gpsLVN/core/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}

abstract class VoidUseCase<Type, Params> {
  void call(Params params);
}

abstract class HasTokenUseCase<Type, Params> {
  Future<void> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object> get props => [];
}
