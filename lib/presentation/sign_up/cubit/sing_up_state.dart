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

class RegisterSuccess extends Register {}

class RegisterError extends Register {
  final String message;

  RegisterError(this.message);
}


class ConfirmRegister extends SingUpState {}

class ConfirmRegisterLoading extends Register {}

class ConfirmRegisterSuccess extends Register {}

class ConfirmRegisterError extends Register {
  final String message;

  ConfirmRegisterError(this.message);
}

class SignUp extends SingUpState {}

class SignUpLoading extends Register {}

class SignUpSuccess extends Register {}

class SignUpError extends Register {
  final String message;

  SignUpError(this.message);
}

class SetPassword extends SingUpState {}

class SetPasswordLoading extends Register {}

class SetPasswordSuccess extends Register {}

class SetPasswordError extends Register {
  final String message;

  SetPasswordError(this.message);
}