part of 'splash_screen_cubit.dart';

sealed class SplashScreenState extends Equatable {
  const SplashScreenState();

  @override
  List<Object> get props => [];
}

final class SplashScreenInitial extends SplashScreenState {}

final class EndSplashScreen extends SplashScreenState {}
