import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../assets.dart';

part 'deposit_state.dart';

class DepositCubit extends Cubit<DepositState> {
  DepositCubit() : super(DepositInitial());

  TextEditingController amountController = TextEditingController();

  int selectedPaymentMethod = 0;

  final List<Map<String, dynamic>> paymentMethods = [
    {'title': 'Apple Pay', 'icon': Asset.applePay},
    {'title': 'G Pay', 'icon': Asset.googlePay},
    {'title': 'PayPal', 'icon': Asset.payPal},
    {'title': 'MasterCard', 'icon': Asset.masterCard},
    {'title': 'VISA', 'icon': Asset.visaCard},
  ];

  void selectPaymentMethod(int index) {
    selectedPaymentMethod = index;
    emit(SelectPaymentMethod());
  }
}
