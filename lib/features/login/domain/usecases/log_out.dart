import 'package:gpsLVN/core/usecases/usecase.dart';
import 'package:gpsLVN/features/login/domain/repositories/user_repository.dart';

class LogOut implements VoidUseCase<void, NoParams> {
  final UserRepository repository;

  const LogOut(this.repository);

  @override
  void call(NoParams params) {
    repository.logout();
  }
}
