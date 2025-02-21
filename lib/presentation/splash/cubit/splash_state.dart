part of 'splash_cubit.dart';

@immutable
abstract class SplashState extends Equatable {
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) => false;
}

class SplashInitial extends SplashState {}
class SplashLoggedIn extends SplashState {}
class SplashDontLoggedIn extends SplashState {}
