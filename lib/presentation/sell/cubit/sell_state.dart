part of 'sell_cubit.dart';

@immutable
abstract class SellState {}

class SellInitial extends SellState {}

class GoldCalcLoading extends SellState {}
class GoldCalcSuccess extends SellState {}
class GoldCalcError extends SellState {
  final String message;
  GoldCalcError(this.message);
}

//---- get live price
class LivePriceLoading extends SellState {}
class LivePriceSuccess extends SellState {}
class LivePriceError extends SellState {
  final String message;
  LivePriceError(this.message);
}

//---- get name and family
class UpdateUserDataLoading extends SellState{}
class UpdateUserDataSuccess extends SellState{}
