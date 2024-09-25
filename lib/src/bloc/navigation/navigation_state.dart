import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  final int selectedIndex;
  final bool isBottomNavBarHidden;
  final bool isBottomNavBarVisible;

  const NavigationState({
    required this.selectedIndex,
    required this.isBottomNavBarHidden,
    required this.isBottomNavBarVisible,
  });

  NavigationState copyWith({
    int? selectedIndex,
    bool? isBottomNavBarHidden,
    bool? isBottomNavBarVisible,
  }) {
    return NavigationState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isBottomNavBarHidden: isBottomNavBarHidden ?? this.isBottomNavBarHidden,
      isBottomNavBarVisible: isBottomNavBarVisible ?? this.isBottomNavBarVisible,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, isBottomNavBarHidden,isBottomNavBarVisible];
}