part of 'search_products_bloc.dart';

class SearchProductsState extends Equatable {
  const SearchProductsState({
    this.requestState = RequestState.init,
    this.products = const [],
    this.query = '',
    this.limit = 20,
    this.skip = 0,
    this.hasMore = false,
    this.errorMessage,
  });

  final RequestState requestState;
  final List<ProductModel> products;
  final String query;
  final int limit;
  final int skip;
  final bool hasMore;
  final String? errorMessage;

  bool get isInitialLoading =>
      requestState == RequestState.loading && products.isEmpty;

  bool get isPaginating =>
      requestState == RequestState.loading && products.isNotEmpty && hasMore;

  SearchProductsState copyWith({
    RequestState? requestState,
    List<ProductModel>? products,
    String? query,
    int? limit,
    int? skip,
    bool? hasMore,
    String? errorMessage,
  }) {
    return SearchProductsState(
      requestState: requestState ?? this.requestState,
      products: products ?? this.products,
      query: query ?? this.query,
      limit: limit ?? this.limit,
      skip: skip ?? this.skip,
      hasMore: hasMore ?? this.hasMore,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    requestState,
    products,
    query,
    limit,
    skip,
    hasMore,
    errorMessage,
  ];
}
