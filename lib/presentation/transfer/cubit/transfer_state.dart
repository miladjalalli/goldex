part of 'transfer_cubit.dart';

@immutable
abstract class TransferState {}

class TransferInitial extends TransferState {}

class SelectedValue extends TransferState {
  String suffix1;
  SelectedValue(this.suffix1);
}
