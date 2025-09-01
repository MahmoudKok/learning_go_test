import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../src/core/architecture/base_usecase.dart';
import '../../../../../src/errors/failures/app_failures.dart';
import '../../data/models/user_model.dart';
import '../repositories/base_profile_repository.dart';

@Injectable()
class GetProfileUseCase extends BaseUseCase<UserModel, NoParameters> {
  final BaseProfileRepository repository;

  GetProfileUseCase(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(NoParameters params) {
    return repository.getProfile();
  }
}

class GetProfileParams {
  final int id;
  const GetProfileParams({required this.id});
}
