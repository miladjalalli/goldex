import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../assets.dart';

part 'gift_card_state.dart';

class GiftCardCubit extends Cubit<GiftCardState> {
  GiftCardCubit() : super(GiftCardInitial());

  Map<int, int> quantities = {};
  List<bool> expandedState = List.generate(2, (index) => false);
  String? selectedDay;
  TextEditingController serialCode = TextEditingController();
  final List<Map<String, String>> giftCards = [
    {'title': 'GIFT CARD', 'amount': '50', 'type' : 'mg'},
    {'title': 'GIFT CARD', 'amount': '100', 'type' : 'mg'},
    {'title': 'GIFT CARD', 'amount': '200', 'type' : 'mg'},
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
    {"giftCardAmount": '50', "giftCardType": 'mg', "giftCardTitle": 'gift card', "number": '1', "issuanceFee": '3', "issuanceAmount": '1.5', "issuanceType": 'mg', "miniCardAmount": '50', "miniCardType": 'mg'},
    {"giftCardAmount": '100', "giftCardType": 'mg', "giftCardTitle": 'gift card', "number": '2', "issuanceFee": '3', "issuanceAmount": '3', "issuanceType": 'mg', "miniCardAmount": '100', "miniCardType": 'mg'},
  ];

  void updateQuantity(int index, int quantity) {
    quantities[index] = quantity;
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
}
