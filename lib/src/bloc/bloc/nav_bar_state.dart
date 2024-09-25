part of 'nav_bar_bloc.dart';

enum NavBarItem { home, search, profile }

 class NavBarState extends Equatable {
  final NavBarItem selectedItem;
  // final int selectedItem;
  // final bool isBottomNavBarHidden;
  // final bool isBottomNavBarVisible;

  const NavBarState({
    required this.selectedItem,
    // required this.isBottomNavBarHidden,
    // required this.isBottomNavBarVisible,
    });
  

  NavBarState copyWith({
    NavBarItem? selectedItem,
    // int? selectedItem,
    // bool? isBottomNavBarHidden,
    // bool? isBottomNavBarVisible,
    }) {
    return NavBarState(
      selectedItem: selectedItem ?? this.selectedItem,
      // isBottomNavBarHidden: isBottomNavBarHidden ?? this.isBottomNavBarHidden,
      // isBottomNavBarVisible: isBottomNavBarVisible ?? this.isBottomNavBarVisible,
    );
  }

  @override
  List<Object> get props => [selectedItem];
  

}

