part of 'order_summary_cubit.dart';

@immutable
abstract class OrderSummaryState {}

class OrderSummaryInitial extends OrderSummaryState {}

//---- get live price
class LivePriceLoading extends OrderSummaryState {}
class LivePriceSuccess extends OrderSummaryState {}
class LivePriceError extends OrderSummaryState {
  final String message;
  LivePriceError(this.message);
}