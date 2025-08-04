import 'package:bloc/bloc.dart';
import 'package:blood_bridge/src/data/dummy/repository/repository.dart';
import 'package:blood_bridge/src/models/carousel_model.dart';
import 'package:equatable/equatable.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
 final BridgeRepository repository;

  CarouselBloc(this.repository) : super(CarouselInitial()) {
    on<FetchCarouselData>((event, emit) async{
      emit(FetchCarouselLoading());
      try {
        final carouselData = await repository.fetchCarouselData();
        emit(FetchCarouselSuccess(carouselData: carouselData));
      } catch (e) {
        emit(FetchCarouselFailed(message: "Failed To Load Carousel Data"));
        throw Exception(e);
      }
    });
  }
}
