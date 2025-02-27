import 'package:bloc/bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/response/currency_balance_response.dart';
import '../../../domain/entity/response/gold_balance_response.dart';
import '../../../domain/repository/api_repository.dart';
import '../../../domain/repository/secure_storage_service.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  ApiRepository apiRepository;
  SecureStorageService secureStorageService;
  LocalAuthentication _auth = LocalAuthentication();

  WalletCubit({required this.apiRepository, required this.secureStorageService}) : super(WalletInitial());

  String? name;
  String? family;
  double? goldBalanceMg;
  double? currencyBalanceUSD;
  final List<Map<String, String>> transactions = [
    {"title": "Withdrawal", "date": "Jan 12", "amount": "100", "type": "dollar", "status": "Pending"},
    {"title": "Send", "date": "Jan 03", "amount": "16", "type": "gr", "status": "Done"},
    {"title": "Receive", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Done"},
    {"title": "Deposit", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Failed"},
    {"title": "Withdrawal", "date": "Dec 20", "amount": "30", "type": "gr", "status": "Done"},
    {"title": "Receive", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Done"},
    {"title": "Withdrawal", "date": "Jan 12", "amount": "100", "type": "dollar", "status": "Pending"},
    {"title": "Send", "date": "Jan 03", "amount": "16", "type": "gr", "status": "Done"},
    {"title": "Receive", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Done"},
    {"title": "Deposit", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Failed"},
    {"title": "Withdrawal", "date": "Dec 20", "amount": "30", "type": "gr", "status": "Done"},
    {"title": "Receive", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Done"},
    {"title": "Withdrawal", "date": "Jan 12", "amount": "100", "type": "dollar", "status": "Pending"},
    {"title": "Send", "date": "Jan 03", "amount": "16", "type": "gr", "status": "Done"},
    {"title": "Receive", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Done"},
    {"title": "Deposit", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Failed"},
    {"title": "Withdrawal", "date": "Dec 20", "amount": "30", "type": "gr", "status": "Done"},
    {"title": "Receive", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Done"},
  ];

  Future<void> loadUserData() async {
    emit(UpdateUserDataLoading());
    name = await secureStorageService.readName();
    family = await secureStorageService.readFamily();
    await getGoldBalance();
    await getCurrencyBalance();
    emit(UpdateUserDataSuccess());
  }

  Future<void> getGoldBalance() async {
    try {
      final res = await apiRepository.goldBalance();
      if (res.statusCode == 200) {
        GoldBalanceResponse response = GoldBalanceResponse.fromJson(res.data);
        goldBalanceMg = response.data!.goldBalanceMg;
      } else {
        emit(UpdateUserDataError('Error on get your balance'));
      }
    } catch (e) {
      emit(UpdateUserDataError(e.toString()));
    }
  }

  Future<void> getCurrencyBalance() async {
    try {
      final res = await apiRepository.currencyBalance();
      if (res.statusCode == 200) {
        CurrencyBalanceResponse response = CurrencyBalanceResponse.fromJson(res.data);
        currencyBalanceUSD = response.data!.currencyBalance;
      } else {
        emit(UpdateUserDataError('Error on get your balance'));
      }
    } catch (e) {
      emit(UpdateUserDataError(e.toString()));
    }
  }
}
