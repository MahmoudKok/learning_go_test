part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = RequestState.init,
    this.products = const [],
    this.hasMore = true,
    this.skip = 0,
    this.limit = 20,
    this.errorMessage,
  });

  final RequestState status;
  final List<ProductModel> products;
  final bool hasMore;
  final int skip;
  final int limit;
  final String? errorMessage;

  HomeState copyWith({
    RequestState? status,
    List<ProductModel>? products,
    bool? hasMore,
    int? skip,
    int? limit,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      hasMore: hasMore ?? this.hasMore,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    products,
    hasMore,
    skip,
    limit,
    errorMessage,
  ];
}
