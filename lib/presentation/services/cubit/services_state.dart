part of 'services_cubit.dart';

@immutable
abstract class ServicesState extends Equatable {
  const ServicesState();

  @override
  bool operator == (Object other) => false;

  @override
  List<Object> get props => [];
}

class ServicesInitial extends ServicesState {}
