import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

// class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
//   final int totalPages;
//    final BuildContext context; // Add context to the constructor

//   OnboardingBloc(this.context, {required this.totalPages}) : super(OnboardingInitial(currentPage: 0)) {
//     on<NextPageTapped>((event, emit) {
//       if (state is OnboardingInitial) {
//         final currentPage = (state as OnboardingInitial).currentPage;
//         if (currentPage < totalPages - 1) {
//           emit(OnboardingInitial(currentPage: currentPage + 1));
//         }
//       }
//     });

//      on<GetStartedTapped>((event, emit) {
//       // Handle onboarding completion, e.g., navigating to the main app screen
//        Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => SignupScreen()), // Replace with your main app screen
//       );
//     });
//   }
// }

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final BuildContext context; // Add context to the constructor

  OnboardingBloc(
    this.context,
  ) : super(const OnboardingState()) {
    on<PageChanged>(_onPageChanged);
    //  on<GetStartedTapped>(_onGetStartedTapped);
  }

  void _onPageChanged(PageChanged event, Emitter<OnboardingState> emit) {
    final showGetStarted = event.page == 2;
    emit(state.copyWith(
      currentPage: event.page,
      showGetStarted: showGetStarted,
    ));
  }

  //  void _onGetStartedTapped(GetStartedTapped event, Emitter<OnboardingState> emit) {
  // Example: You could update the state to indicate that onboarding is complete
  // You can also trigger any other actions needed when the user taps "Get Started"
  // For example, you might want to log this event or persist data to local storage
  // }
}
