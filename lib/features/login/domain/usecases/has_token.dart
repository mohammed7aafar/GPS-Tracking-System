import 'package:gpsLVN/core/usecases/usecase.dart';
import 'package:gpsLVN/features/login/domain/repositories/user_repository.dart';

class HasToken implements HasTokenUseCase<Future<void>, NoParams> {
  final UserRepository repository;

  const HasToken(this.repository);

  @override
  Future<void> call(NoParams params) async {
    return await repository.hasToken();
  }
}
