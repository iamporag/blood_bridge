part of 'carousel_bloc.dart';

sealed class CarouselState extends Equatable {
  const CarouselState();
}

final class CarouselInitial extends CarouselState {
  @override
  List<Object> get props => [];
}
