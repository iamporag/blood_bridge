part of 'request_form_bloc.dart';

 class RequestFormState extends Equatable {
  final int step;
  final String name;
  final String email;
  final String phone;

  const RequestFormState(
      {this.step = 0, this.name = '', this.email = '', this.phone = ''});

  RequestFormState copyWith({
    int? step,
    String? name,
    String? email,
    String? phone,
  }) {
    return RequestFormState (
       step: step ?? this.step,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object> get props => [step, name, email, phone];
}

final class RequestFormInitial extends RequestFormState {}
