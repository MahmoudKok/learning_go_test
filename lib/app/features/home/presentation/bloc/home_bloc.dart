import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_go_test/src/core/enums/general_enums.dart';

import '../../../../../src/logger/dev_logger.dart';
import '../../data/models/product_model.dart';
import '../../domain/entities/get_products_params.dart';
import '../../domain/usecases/get_products_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductsUseCase _getProductsUseCase;
  bool _isFetchingMore = false;

  HomeBloc(this._getProductsUseCase) : super(const HomeState()) {
    on<FetchProductsEvent>(_onFetchProducts);
    on<FetchMoreProductsEvent>(_onFetchMoreProducts);
  }

  Future<void> _onFetchProducts(
    FetchProductsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: RequestState.loading, skip: 0, products: []));
    final result = await _getProductsUseCase(
      GetProductsParams(limit: state.limit, skip: 0),
    );
    result.fold(
      (l) => emit(
        state.copyWith(
          status: RequestState.error,
          errorMessage: l.errorResponse.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: RequestState.success,
          products: r.products,
          hasMore: r.products.length < r.total,
          skip: r.products.length,
        ),
      ),
    );
  }

  Future<void> _onFetchMoreProducts(
    FetchMoreProductsEvent event,
    Emitter<HomeState> emit,
  ) async {
    print('_onFetchMoreProducts');
    if (_isFetchingMore) return;
    if (!state.hasMore || state.status == RequestState.loading) return;

    _isFetchingMore = true;
    // تابع الكود عادي

    final result = await _getProductsUseCase(
      GetProductsParams(limit: state.limit, skip: state.skip),
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          status: RequestState.error,
          errorMessage: l.errorResponse.message,
        ),
      ),
      (r) {
        final updatedList = List.of(state.products)..addAll(r.products);
        Dev.logLine('UpdatedList len is :${updatedList.length}');
        emit(
          state.copyWith(
            status: RequestState.success,
            products: updatedList,
            hasMore: updatedList.length < r.total,
            skip: updatedList.length,
          ),
        );
      },
    );
    _isFetchingMore = false;
  }
}
