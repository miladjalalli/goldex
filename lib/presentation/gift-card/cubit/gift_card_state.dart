part of 'gift_card_cubit.dart';

@immutable
abstract class GiftCardState {}

class GiftCardInitial extends GiftCardState {}

class UpdateQuantity extends GiftCardState{}
class ChangeExpandedState extends GiftCardState{}
class UpdateSelectedDay extends GiftCardState{}

//--- gift Cards
class GiftCardsLoading extends GiftCardState{}
class GiftCardsSuccess extends GiftCardState{
  final GiftCardsResponseData res;
  GiftCardsSuccess(this.res);
}
class GiftCardsError extends GiftCardState{
  final String message;
  GiftCardsError(this.message);
}

//--- get balancy
class GetGoldBalanceLoading extends GiftCardState {}
class GetGoldBalanceSuccess extends GiftCardState {}
class GetGoldBalanceError extends GiftCardState {
  final String message;
  GetGoldBalanceError(this.message);
}