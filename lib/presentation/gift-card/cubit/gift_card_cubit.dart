import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';
import '../../../core/assets.dart';
import '../../../domain/entity/response/currency_balance_response.dart';
import '../../../domain/entity/response/gift_cards_response.dart';
import '../../../domain/entity/response/gold_balance_response.dart';
import '../../../domain/repository/api_repository.dart';
import '../../../domain/repository/secure_storage_service.dart';
part 'gift_card_state.dart';

class GiftCardCubit extends Cubit<GiftCardState> {
  ApiRepository apiRepository;
  SecureStorageService secureStorageService;
  LocalAuthentication _auth = LocalAuthentication();
  GiftCardCubit({required this.apiRepository, required this.secureStorageService}) : super(GiftCardInitial());

  double? goldBalanceMg;
  GiftCardsResponse? giftCardsResponse;
  Map<String, int> quantities = {};
  List<bool> expandedState = List.generate(2, (index) => false);
  String? selectedDay;
  TextEditingController serialCode = TextEditingController();

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
    {"giftCardAmount": '50', "giftCardType": 'mg', "giftCardTitle": 'gift card', "number": '1', "issuanceFee": '3', "issuanceAmount": '1.5', "issuanceType": 'mg', "miniCardAmount": '50', "miniCardType": 'mg'},
    {"giftCardAmount": '100', "giftCardType": 'mg', "giftCardTitle": 'gift card', "number": '2', "issuanceFee": '3', "issuanceAmount": '3', "issuanceType": 'mg', "miniCardAmount": '100', "miniCardType": 'mg'},
  ];

  void updateQuantity(String giftCardCode, int quantity) {
    quantities[giftCardCode] = quantity;
    emit(UpdateQuantity());
  }

  int get totalQuantity {
    return quantities.values.fold(0, (sum, qty) => sum + qty);
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

  Future<void> giftCardsRequest() async {
    emit(GiftCardsLoading());
    try {
      final res = await apiRepository.giftCards();
      if (res.statusCode == 200) {
        GiftCardsResponse response = GiftCardsResponse.fromJson(res.data);
        emit(GiftCardsSuccess(response.data!));
      } else {
        var result = GiftCardsResponse.fromJson(res.data);
        emit(GiftCardsError(result.message ??'Error on get live price'));
      }
    } catch (e) {
      emit(GiftCardsError(e.toString()));
    }
  }

  Future<void> getGoldBalance() async {
    emit(GetGoldBalanceLoading());
    try {
      final res = await apiRepository.goldBalance();
      if (res.statusCode == 200) {
        GoldBalanceResponse response = GoldBalanceResponse.fromJson(res.data);
        goldBalanceMg = response.data!.goldBalanceMg;
        emit(GetGoldBalanceSuccess());
      } else {
        emit(GetGoldBalanceError('Error on get your balance'));
      }
    } catch (e) {
      emit(GetGoldBalanceError(e.toString()));
    }
  }

}
