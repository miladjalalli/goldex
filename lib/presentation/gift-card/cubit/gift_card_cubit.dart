import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gift_card_state.dart';

class GiftCardCubit extends Cubit<GiftCardState> {
  GiftCardCubit() : super(GiftCardInitial());

  final List<Map<String, String>> giftCards = [
    {'title': 'GIFT CARD', 'amount': '50 mg'},
    {'title': 'GIFT CARD', 'amount': '100 mg'},
    {'title': 'GIFT CARD', 'amount': '200 mg'},
    {'title': 'GIFT CARD', 'amount': 'Custom'},
  ];

}
