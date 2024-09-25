import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  NavBarBloc()
      : super(
          const NavBarState(
            selectedItem:NavBarItem.home,
            // isBottomNavBarHidden: false,
            // isBottomNavBarVisible: true,
          ),
        ) {
    on<NavBarItemSelected>((event, emit) {
      emit(state.copyWith(
        selectedItem: event.selectedItem,
      ));
    });
    // on<HideBottomNavBarEvent>((event, emit) {
    //  emit(state.copyWith(isBottomNavBarHidden: true, isBottomNavBarVisible: false));
    // });
    // on<VisibleBottomNavBarEvent>((event, emit){
    //    emit(state.copyWith(isBottomNavBarVisible: true,isBottomNavBarHidden: false));
    // });
  }
}
