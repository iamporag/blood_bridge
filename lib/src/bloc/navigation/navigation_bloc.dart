import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc()
      : super(const NavigationState(
          selectedIndex: 0,
        )) {
    on<ChangeTabEvent>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
  }
}
