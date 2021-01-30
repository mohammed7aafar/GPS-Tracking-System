
import 'package:gpsLVN/core/usecases/usecase.dart';
import 'package:gpsLVN/features/login/domain/repositories/user_repository.dart';

class DisposeUseCase implements VoidUseCase<void, NoParams> {
  final UserRepository repository;

  const DisposeUseCase(this.repository);

  @override
  void call(NoParams params) {
    repository.dispose();
  }
}
