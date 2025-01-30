import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../assets.dart';

part 'transfer_state.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit() : super(TransferInitial());

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController(text: '250');
  String suffix1 = '';

  final List<Map<String, String>> items = [
    {'value': 'Gold', 'icon': Asset.gold, 'label': 'gold', 'suffix': 'gram'},
    {'value': 'Dollar', 'icon': Asset.dollar, 'label': 'dollar', 'suffix': 'USD'},
  ];

  void selectValue(String value, String Function(String) translate) {
    if (value == 'Gold') {
      suffix1 = translate('gram');
    }
    if (value == 'Dollar') {
      suffix1 = translate('USD');
    }
    emit(SelectedValue(suffix1));
  }
}
