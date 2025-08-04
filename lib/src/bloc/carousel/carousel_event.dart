part of 'carousel_bloc.dart';

sealed class CarouselEvent extends Equatable {
  const CarouselEvent();
}

 class FetchCarouselData extends CarouselEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
