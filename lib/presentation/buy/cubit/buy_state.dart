part of 'buy_cubit.dart';

@immutable
abstract class BuyState {}

class BuyInitial extends BuyState {}

class GoldCalcLoading extends BuyState {}
class GoldCalcSuccess extends BuyState {}
class GoldCalcError extends BuyState {
  final String message;
  GoldCalcError(this.message);
}

//----
class ConfirmLoading extends BuyState {}
class ConfirmSuccess extends BuyState {}
class ConfirmError extends BuyState {
  final String message;
  ConfirmError(this.message);
}

//---- get live price
class LivePriceLoading extends BuyState {}
class LivePriceSuccess extends BuyState {}
class LivePriceError extends BuyState {
  final String message;
  LivePriceError(this.message);
}

//---- get name and family
class UpdateUserDataLoading extends BuyState{}
class UpdateUserDataSuccess extends BuyState{}