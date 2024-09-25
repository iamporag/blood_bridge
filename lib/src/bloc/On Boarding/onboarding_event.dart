part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

// class NextPageTapped extends OnboardingEvent {}

// class GetStartedTapped extends OnboardingEvent {}

class PageChanged extends OnboardingEvent {
  final int page;

  const PageChanged(this.page);

  @override
  List<Object> get props => [page];
}

final class GetStartedTapped extends OnboardingEvent {}