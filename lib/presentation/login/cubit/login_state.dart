part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) => false;

  @override
  int get hashCode => super.hashCode;
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponseData response;
  LoginSuccess(this.response);

}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);

}
