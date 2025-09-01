import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_go_test/app/features/home/data/models/product_model.dart';

import '../../../../../src/core/architecture/base_usecase.dart';
import '../../../../../src/errors/failures/app_failures.dart';
import '../repositories/base_product_details_repository.dart';

@Injectable()
class GetProductDetailsUseCase
    extends BaseUseCase<ProductModel, GetProductDetailsParams> {
  final BaseProductDetailsRepository repository;

  GetProductDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, ProductModel>> call(
    GetProductDetailsParams params,
  ) async {
    return await repository.getProductDetails(params.id);
  }
}

class GetProductDetailsParams {
  final String id;

  const GetProductDetailsParams(this.id);
}
