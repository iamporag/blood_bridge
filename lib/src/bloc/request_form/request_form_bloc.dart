// ignore_for_file: override_on_non_overriding_member

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'request_form_event.dart';
part 'request_form_state.dart';

class RequestFormBloc extends Bloc<RequestFormEvent, RequestFormState> {
  RequestFormBloc() : super(RequestFormInitial());
  @override
  Stream<RequestFormState> mapEventToState(RequestFormEvent event) async* {
    if (event is UpdateStep) {
      yield state.copyWith(step: event.currentStep);
    }
  }
}
