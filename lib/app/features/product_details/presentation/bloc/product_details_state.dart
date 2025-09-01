part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {
  final ProductModel? product;
  final RequestState requestState;
  final String message;

  const ProductDetailsState({
    this.product,
    this.requestState = RequestState.init,
    this.message = '',
  });

  ProductDetailsState copyWith({
    ProductModel? product,
    RequestState? requestState,
    String? message,
  }) {
    return ProductDetailsState(
      product: product ?? this.product,
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [product, requestState, message];
}
