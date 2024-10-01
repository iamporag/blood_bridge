part of 'request_form_bloc.dart';

sealed class RequestFormEvent extends Equatable {
  const RequestFormEvent();

  @override
  List<Object> get props => [];
}


class UpdateStep extends RequestFormEvent {
  final int currentStep;
  UpdateStep(this.currentStep);
  
  @override
  List<Object> get props => [currentStep];
}