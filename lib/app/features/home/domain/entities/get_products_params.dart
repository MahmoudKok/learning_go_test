import 'package:equatable/equatable.dart';

class GetProductsParams extends Equatable {
  const GetProductsParams({required this.limit, required this.skip});

  final int limit;
  final int skip;

  @override
  List<Object?> get props => [limit, skip];
}
