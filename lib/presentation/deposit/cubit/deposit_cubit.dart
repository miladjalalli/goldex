import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';
import '../../../core/assets.dart';
import '../../../domain/entity/response/currency_balance_response.dart';
import '../../../domain/repository/api_repository.dart';
import '../../../domain/repository/secure_storage_service.dart';
part 'deposit_state.dart';

class DepositCubit extends Cubit<DepositState> {
  ApiRepository apiRepository;
  SecureStorageService secureStorageService;
  LocalAuthentication _auth = LocalAuthentication();
  DepositCubit({required this.apiRepository, required this.secureStorageService}) : super(DepositInitial());

  TextEditingController amountController = TextEditingController();

  int selectedPaymentMethod = 0;
  double? currencyBalanceUSD;

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
