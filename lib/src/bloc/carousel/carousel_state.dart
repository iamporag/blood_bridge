part of 'carousel_bloc.dart';

sealed class CarouselState extends Equatable {
  const CarouselState();
}

final class CarouselInitial extends CarouselState {
  @override
  List<Object> get props => [];
}

final class FetchCarouselLoading extends CarouselState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class FetchCarouselSuccess extends CarouselState {
  final List<CarouselModel> carouselData;

  const FetchCarouselSuccess({required this.carouselData});
  @override
  List<Object?> get props => [carouselData];
}

final class FetchCarouselFailed extends CarouselState {
  final String message;

  const FetchCarouselFailed({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
