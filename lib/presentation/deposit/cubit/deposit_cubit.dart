import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'deposit_state.dart';

class DepositCubit extends Cubit<DepositState> {
  DepositCubit() : super(DepositInitial());

  TextEditingController amountController = TextEditingController();

  int selectedPaymentMethod = 0;

  final List<Map<String, dynamic>> paymentMethods = [
    {'title': 'Apple Pay', 'icon': 'assets/icons/pay/apple_pay.svg'},
    {'title': 'G Pay', 'icon': 'assets/icons/pay/google_pay.svg'},
    {'title': 'PayPal', 'icon': 'assets/icons/pay/pay_pal.svg'},
    {'title': 'MasterCard', 'icon': 'assets/icons/pay/master_card.svg'},
    {'title': 'VISA', 'icon': 'assets/icons/pay/visa_card.svg'},
  ];

  void selectPaymentMethod(int index) {
    selectedPaymentMethod = index;
    emit(SelectPaymentMethod());
  }
}
