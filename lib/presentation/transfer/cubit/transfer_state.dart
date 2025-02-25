part of 'transfer_cubit.dart';

@immutable
abstract class TransferState {}

class TransferInitial extends TransferState {}

class SelectedValue extends TransferState {
  String suffix1;
  SelectedValue(this.suffix1);
}

class GoldBalanceLoading extends TransferState{}
class GoldBalanceLoaded extends TransferState{}
class GoldBalanceError extends TransferState{
  String error;

  GoldBalanceError(this.error);
}

