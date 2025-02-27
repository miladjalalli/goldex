part of 'deposit_cubit.dart';

@immutable
abstract class DepositState {}

class DepositInitial extends DepositState {}

class SelectPaymentMethod extends DepositState {}

//--- get balancy
class GetCurrencyBalanceLoading extends DepositState {}
class GetCurrencyBalanceSuccess extends DepositState {}
class GetCurrencyBalanceError extends DepositState {
  final String message;
  GetCurrencyBalanceError(this.message);
}

