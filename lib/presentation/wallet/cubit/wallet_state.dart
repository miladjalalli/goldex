part of 'wallet_cubit.dart';

@immutable
abstract class WalletState {}

class WalletInitial extends WalletState {}

//---- get name and family
class UpdateUserDataLoading extends WalletState{}
class UpdateUserDataSuccess extends WalletState{}
class UpdateUserDataError extends WalletState{
  final String message;
  UpdateUserDataError(this.message);
}