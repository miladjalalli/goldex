part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class UpdateUserDataLoading extends ProfileState{}
class UpdateUserDataSuccess extends ProfileState{}
class LogoutUserData extends ProfileState{}
