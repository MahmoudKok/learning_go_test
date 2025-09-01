import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../src/core/enums/general_enums.dart';
import '../../../home/data/models/product_model.dart';
import '../../domain/entities/search_query_params.dart';
import '../../domain/usecases/search_products_use_case.dart';

part 'search_products_event.dart';
part 'search_products_state.dart';

@Injectable()
class SearchProductsBloc
    extends Bloc<SearchProductsEvent, SearchProductsState> {
  SearchProductsBloc(this._useCase) : super(const SearchProductsState()) {
    on<SearchInitialFetchEvent>(_onInitialFetch);
    on<SearchQueryChangedEvent>(_onQueryChanged);
    on<SearchFetchMoreEvent>(_onFetchMore);
    on<SearchClearEvent>(_onClear);
  }

  final SearchProductsUseCase _useCase;
  Timer? _debounce;

  Future<void> _onInitialFetch(
    SearchInitialFetchEvent event,
    Emitter<SearchProductsState> emit,
  ) async {
    if (state.query.trim().isEmpty) return; // nothing to fetch
    emit(
      state.copyWith(requestState: RequestState.loading, skip: 0, products: []),
    );
    final res = await _useCase(
      SearchQueryParams(q: state.query.trim(), limit: state.limit, skip: 0),
    );
    res.fold(
      (l) => emit(
        state.copyWith(
          requestState: RequestState.error,
          errorMessage: l.errorResponse.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          requestState: RequestState.success,
          products: r.products,
          hasMore: r.products.length < r.total,
          skip: r.products.length,
        ),
      ),
    );
  }

  Future<void> _onQueryChanged(
    SearchQueryChangedEvent event,
    Emitter<SearchProductsState> emit,
  ) async {
    final q = event.query;
    emit(state.copyWith(query: q));

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () async {
      if (q.trim().isEmpty) {
        add(const SearchClearEvent());
      } else {
        add(const SearchInitialFetchEvent());
      }
    });
  }

  Future<void> _onFetchMore(
    SearchFetchMoreEvent event,
    Emitter<SearchProductsState> emit,
  ) async {
    if (!state.hasMore || state.requestState == RequestState.loading) return;
    emit(state.copyWith(requestState: RequestState.loading));
    final res = await _useCase(
      SearchQueryParams(
        q: state.query.trim(),
        limit: state.limit,
        skip: state.skip,
      ),
    );
    res.fold(
      (l) => emit(
        state.copyWith(
          requestState: RequestState.error,
          errorMessage: l.errorResponse.message,
        ),
      ),
      (r) {
        final updated = List.of(state.products)..addAll(r.products);
        emit(
          state.copyWith(
            requestState: RequestState.success,
            products: updated,
            hasMore: updated.length < r.total,
            skip: updated.length,
          ),
        );
      },
    );
  }

  Future<void> _onClear(
    SearchClearEvent event,
    Emitter<SearchProductsState> emit,
  ) async {
    emit(
      state.copyWith(
        requestState: RequestState.init,
        products: const [],
        skip: 0,
        hasMore: false,
        errorMessage: null,
      ),
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
