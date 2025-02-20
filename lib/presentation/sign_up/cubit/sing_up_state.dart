part of 'sing_up_cubit.dart';

@immutable
abstract class SingUpState extends Equatable {
  const SingUpState();

  @override
  bool operator ==(Object other) => false;

  @override
  List<Object> get props => [];
}

class SingUpInitial extends SingUpState {}

class SelectedValue extends SingUpState {}

class Register extends SingUpState {}

class RegisterLoading extends Register {}

class RegisterSuccess extends Register {
  final RegisterResponseData response;

  RegisterSuccess(this.response);
}

class RegisterError extends Register {
  final String message;

  RegisterError(this.message);
}
