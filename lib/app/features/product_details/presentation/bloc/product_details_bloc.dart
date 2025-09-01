import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_go_test/app/features/home/data/models/product_model.dart';

import '../../../../../src/core/enums/general_enums.dart';
import '../../domain/usecases/get_product_details_usecase.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

@Injectable()
class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  ProductDetailsBloc(this.getProductDetailsUseCase)
    : super(const ProductDetailsState()) {
    on<GetProductDetailsEvent>(_onGetProductDetails);
  }

  Future<void> _onGetProductDetails(
    GetProductDetailsEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await getProductDetailsUseCase(
      GetProductDetailsParams(event.id),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          requestState: RequestState.error,
          message: failure.errorResponse.message,
        ),
      ),
      (product) => emit(
        state.copyWith(requestState: RequestState.success, product: product),
      ),
    );
  }
}
