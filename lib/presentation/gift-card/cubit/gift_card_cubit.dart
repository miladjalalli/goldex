import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../assets.dart';

part 'gift_card_state.dart';

class GiftCardCubit extends Cubit<GiftCardState> {
  GiftCardCubit() : super(GiftCardInitial());

  Map<int, int> quantities = {};
  List<bool> expandedState = List.generate(2, (index) => false);

  final List<Map<String, String>> giftCards = [
    {'title': 'GIFT CARD', 'amount': '50', 'type' : 'mg'},
    {'title': 'GIFT CARD', 'amount': '100', 'type' : 'mg'},
    {'title': 'GIFT CARD', 'amount': '200', 'type' : 'mg'},
  ];

  List<Map<String, dynamic>> items = [
    { 'title': 'In Person', 'icon': Asset.inPerson,'content': 'Here is the content for "Get your Gold"'},
    { 'title': 'Send by post', 'icon': Asset.post,'content': 'Here is the content for "Gift Card"'},
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
}
