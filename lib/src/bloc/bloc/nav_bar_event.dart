part of 'nav_bar_bloc.dart';

sealed class NavBarEvent extends Equatable {
  const NavBarEvent();

  @override
  List<Object> get props => [];
}

// class ChangeTabEvent extends NavBarEvent {
//   final int index;

//   const ChangeTabEvent(this.index);

//   @override
//   List<Object> get props => [index];
// }

class NavBarItemSelected extends NavBarEvent {
  final NavBarItem selectedItem;

  const NavBarItemSelected(this.selectedItem);

  @override
  List<Object> get props => [selectedItem];
}


class HideBottomNavBarEvent extends NavBarEvent {
  final bool isHidden;

  const HideBottomNavBarEvent({this.isHidden = true});

  @override
  List<Object> get props => [isHidden];
}

class VisibleBottomNavBarEvent extends NavBarEvent {
  final bool isVisible;

  const VisibleBottomNavBarEvent({this.isVisible = true});

  @override
  List<Object> get props => [isVisible];
}

