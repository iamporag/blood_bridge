part of 'onboarding_bloc.dart';

// sealed 
class OnboardingState extends Equatable {
  final int currentPage;
  final bool showGetStarted;
  const OnboardingState({
    this.currentPage = 0,
    this.showGetStarted = false,
  });
  OnboardingState copyWith({
    int? currentPage,
    bool? showGetStarted,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      showGetStarted: showGetStarted ?? this.showGetStarted,
    );
  }

  @override
  List<Object> get props => [currentPage, showGetStarted];
}

// final class OnboardingInitial extends OnboardingState {
//     final int currentPage;

//   const OnboardingInitial({this.currentPage = 0});

//   @override
//   List<Object> get props => [currentPage];
// }
