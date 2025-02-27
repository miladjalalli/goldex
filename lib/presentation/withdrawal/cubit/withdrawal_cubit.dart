import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/response/currency_balance_response.dart';
import '../../../domain/repository/api_repository.dart';
import '../../../domain/repository/secure_storage_service.dart';

part 'withdrawal_state.dart';

class WithdrawalCubit extends Cubit<WithdrawalState> {
  ApiRepository apiRepository;
  SecureStorageService secureStorageService;
  LocalAuthentication _auth = LocalAuthentication();
  WithdrawalCubit({required this.apiRepository, required this.secureStorageService}) : super(WithdrawalInitial());

  double? currencyBalanceUSD;

  TextEditingController amountController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();

  Future<void> getCurrencyBalance() async {
    emit(GetCurrencyBalanceLoading());
    try {
      final res = await apiRepository.currencyBalance();
      if (res.statusCode == 200) {
        CurrencyBalanceResponse response = CurrencyBalanceResponse.fromJson(res.data);
        currencyBalanceUSD = response.data!.currencyBalance;
        emit(GetCurrencyBalanceSuccess());
      } else {
        emit(GetCurrencyBalanceError('Error on get your balance'));
      }
    } catch (e) {
      emit(GetCurrencyBalanceError(e.toString()));
    }
  }
}
