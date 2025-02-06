part of 'give_gold_cubit.dart';

@immutable
abstract class GiveGoldState {}

class GiveGoldInitial extends GiveGoldState {}

class UpdateQuantity extends GiveGoldState {}
class ChangeExpandedState extends GiveGoldState {}
class UpdateSelectedDay extends GiveGoldState {}
