import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:goldex/domain/entity/response/currency_balance_response.dart';
import 'package:goldex/domain/entity/response/gold_balance_response.dart';
import 'package:goldex/domain/repository/api_repository.dart';

import '../../../core/assets.dart';

part 'transfer_state.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit({required this.apiRepository}) : super(TransferInitial());

  ApiRepository apiRepository;
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String selectedItem = 'Gold';
  String selectedSuffix = '';
  double? goldBalanceMg;
  double? currencyBalanceUSD;

  final List<Map<String, String>> items = [
    {'value': 'Gold', 'icon': Asset.gold, 'label': 'gold', 'suffix': 'milliGram'},
    {'value': 'Dollar', 'icon': Asset.dollar, 'label': 'dollar', 'suffix': 'USD'},
  ];

  void selectValue(String value, String Function(String) translate) {
    selectedItem = value;
    if (value == 'Gold') {
      selectedSuffix = translate('milliGram');
      getGoldBalance();
    }
    if (value == 'Dollar') {
      selectedSuffix = translate('USD');
      getCurrencyBalance();
    }
    emit(SelectedValue(selectedSuffix));
  }

  //gold-balance

  Future<void> getGoldBalance() async {
    emit(GoldBalanceLoading());
    try {
      final res = await apiRepository.goldBalance();
      GoldBalanceResponse response = GoldBalanceResponse.fromJson(res.data);
      if (res.statusCode == 200) {
        goldBalanceMg = response.data!.goldBalanceMg;
        amountController.text = (goldBalanceMg??0).toString();
        emit(GoldBalanceLoaded());
      } else {
        emit(GoldBalanceError('Error on get your balance'));
      }
    } catch (e) {
      emit(GoldBalanceError(e.toString()));
    }
  }

  Future<void> getCurrencyBalance() async {
    emit(GoldBalanceLoading());
    try {
      final res = await apiRepository.currencyBalance();
      CurrencyBalanceResponse response = CurrencyBalanceResponse.fromJson(res.data);
      if (res.statusCode == 200) {
        currencyBalanceUSD = response.data!.currencyBalance;
        amountController.text = currencyBalanceUSD.toString();
        emit(GoldBalanceLoaded());
      } else {
        emit(GoldBalanceError('Error on get your balance'));
      }
    } catch (e) {
      emit(GoldBalanceError(e.toString()));
    }
  }


  Future<void> transferCurrency() async {
    emit(GoldOrMoneyTransferLoading());
    // try {
    //   var data = {
      //   "mobile": 0,
      //   "amount": 0
      // };
      // final res = await apiRepository.transferCurrencyWithMobile(data);
      // GetCalcResponse response = GetCalcResponse.fromJson(res.data);
      // if (res.statusCode == 200) {
      //
      //   emit(GoldOrMoneyTransferSuccess());
    //   } else {
    //     emit(GoldOrMoneyTransferError('Error on get calc'));
    //   }
    // } catch (e) {
    //   emit(GoldOrMoneyTransferError(e.toString()));
    // }
  }
  
}
