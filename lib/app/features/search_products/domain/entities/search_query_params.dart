import 'package:equatable/equatable.dart';

class SearchQueryParams extends Equatable {
  const SearchQueryParams({
    required this.q,
    required this.limit,
    required this.skip,
  });

  /// Search text
  final String q;

  /// Page size
  final int limit;

  /// Offset
  final int skip;

  @override
  List<Object?> get props => [q, limit, skip];
}
