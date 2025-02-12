part of 'sing_up_cubit.dart';

@immutable
abstract class SingUpState extends Equatable {
  const SingUpState();

  @override
  bool operator ==(Object other) => false;

  @override
  List<Object> get props => [];
}

class SingUpInitial extends SingUpState {
}

class SelectedValue extends SingUpState {}


class SingUpLoading extends SingUpState {}

class SingUpSuccess extends SingUpState {
  final Response response;
  SingUpSuccess(this.response);

}

class SingUpError extends SingUpState {
  final String message;
  SingUpError(this.message);

}

