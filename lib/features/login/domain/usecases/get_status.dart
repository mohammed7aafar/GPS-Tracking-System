import 'package:gpsLVN/core/usecases/usecase.dart';
import 'package:gpsLVN/features/login/domain/repositories/user_repository.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class GetStatus implements StreamUseCase<AuthenticationStatus, NoParams> {
  final UserRepository repository;
  const GetStatus(this.repository);

  @override
  Stream<AuthenticationStatus> call(NoParams params) async* {
    yield* repository.getStatus();
  }
}
