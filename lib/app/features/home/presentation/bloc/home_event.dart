part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

/// Triggered when screen opens (first load)
class FetchProductsEvent extends HomeEvent {
  const FetchProductsEvent();
}

/// Triggered when user scrolls to bottom (pagination)
class FetchMoreProductsEvent extends HomeEvent {
  const FetchMoreProductsEvent();
}
