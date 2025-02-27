import 'package:bloc/bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';

import '../../../core/assets.dart';
import '../../../domain/entity/response/currency_balance_response.dart';
import '../../../domain/repository/api_repository.dart';
import '../../../domain/repository/secure_storage_service.dart';

part 'give_gold_state.dart';

class GiveGoldCubit extends Cubit<GiveGoldState> {
  ApiRepository apiRepository;
  SecureStorageService secureStorageService;
  LocalAuthentication _auth = LocalAuthentication();
  GiveGoldCubit({required this.apiRepository, required this.secureStorageService}) : super(GiveGoldInitial());

  double? currencyBalanceUSD;
  String? selectedDay;
  List<bool> expandedState = List.generate(2, (index) => false);
  Map<int, int> quantities = {};
  int get totalQuantity {
    return quantities.values.fold(0, (sum, qty) => sum + qty);
  }

  void updateQuantity(int index, int quantity) {
    quantities[index] = quantity;
    emit(UpdateQuantity());
  }

  void toggleExpanded(int index) {
    expandedState[index] = !expandedState[index];
    for (int i = 0; i < expandedState.length; i++) {
      if (i != index) {
        expandedState[i] = false;
      }
    }
    emit(ChangeExpandedState());
  }

  void updateSelectedDay(String day) {
    selectedDay = day;
    emit(UpdateSelectedDay()); // Emit a new state to rebuild UI
  }

  final List<Map<String, String>> giftCards = [
    {'title': 'GOLD BAR', 'amount': '5', 'type' : 'gram'},
    {'title': 'GOLD BAR', 'amount': '10', 'type' : 'gram'},
    {'title': 'GOLD BAR', 'amount': '15', 'type' : 'gram'},
  ];

  List<Map<String, dynamic>> items = [
    { 'title': 'In Person', 'icon': Asset.inPerson,'content': 'Here is the content for "Get your Gold"', "active": true},
    { 'title': 'Send by post', 'icon': Asset.post,'content': 'Here is the content for "Gift Card"', "active" : false},
  ];

  final List<Map<String, String>> visitDays = [
    {'day': 'Sunday', 'hour': '9-17', 'date': '21/03/2025'},
    {'day': 'Monday', 'hour': '9-17', 'date': '22/03/2025'},
    {'day': 'Tuesday', 'hour': '9-17', 'date': '23/03/2025'},
    {'day': 'Wednesday', 'hour': '9-17', 'date': '24/03/2025'},
    {'day': 'Thursday', 'hour': '9-17', 'date': '25/03/2025'},
  ];

  final List<Map<String, String>> orderSummaryData = [
    {"giftCardAmount": '5', "giftCardType": 'g', "giftCardTitle": 'gold bar', "number": '1', "issuanceFee": '3', "issuanceAmount": '15', "issuanceType": 'mg', "miniCardAmount": '5', "miniCardType": 'g'},
    {"giftCardAmount": '30', "giftCardType": 'g', "giftCardTitle": 'gold bar', "number": '2', "issuanceFee": '3', "issuanceAmount": '180', "issuanceType": 'mg', "miniCardAmount": '15', "miniCardType": 'g'},
  ];

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
