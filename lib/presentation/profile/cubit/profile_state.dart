part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class UpdateUserData extends ProfileState{}
class LogoutUserData extends ProfileState{}
