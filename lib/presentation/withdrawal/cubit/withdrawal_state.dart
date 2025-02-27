part of 'withdrawal_cubit.dart';

@immutable
abstract class WithdrawalState {}

class WithdrawalInitial extends WithdrawalState {}

//--- get balancy
class GetCurrencyBalanceLoading extends WithdrawalState {}
class GetCurrencyBalanceSuccess extends WithdrawalState {}
class GetCurrencyBalanceError extends WithdrawalState {
  final String message;
  GetCurrencyBalanceError(this.message);
}