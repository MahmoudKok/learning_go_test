part of 'search_products_bloc.dart';

abstract class SearchProductsEvent extends Equatable {
  const SearchProductsEvent();
  @override
  List<Object?> get props => [];
}

/// Fire when the screen opens or when you want to fetch with current query.
class SearchInitialFetchEvent extends SearchProductsEvent {
  const SearchInitialFetchEvent();
}

/// Fire when user types; bloc will debounce it.
class SearchQueryChangedEvent extends SearchProductsEvent {
  const SearchQueryChangedEvent(this.query);
  final String query;
  @override
  List<Object?> get props => [query];
}

/// Fire when reaching bottom for pagination.
class SearchFetchMoreEvent extends SearchProductsEvent {
  const SearchFetchMoreEvent();
}

/// Optional: clear current query and results.
class SearchClearEvent extends SearchProductsEvent {
  const SearchClearEvent();
}
