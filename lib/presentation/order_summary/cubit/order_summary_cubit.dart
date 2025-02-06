import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_summary_state.dart';

class OrderSummaryCubit extends Cubit<OrderSummaryState> {
  OrderSummaryCubit() : super(OrderSummaryInitial());


}

