import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object?> get props => [];
}

class ChangeTabEvent extends NavigationEvent {
  final int index;

  const ChangeTabEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class HideBottomNavBarEvent extends NavigationEvent {
  final bool isHidden;

  const HideBottomNavBarEvent({this.isHidden = true});

  @override
  List<Object?> get props => [isHidden];
}

class VisibleBottomNavBarEvent extends NavigationEvent {
  final bool isVisible;

  const VisibleBottomNavBarEvent({this.isVisible = true});

  @override
  List<Object?> get props => [isVisible];
}