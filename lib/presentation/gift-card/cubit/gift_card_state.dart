part of 'gift_card_cubit.dart';

@immutable
abstract class GiftCardState {}

class GiftCardInitial extends GiftCardState {}

class UpdateQuantity extends GiftCardState{}
class ChangeExpandedState extends GiftCardState{}
class UpdateSelectedDay extends GiftCardState{}