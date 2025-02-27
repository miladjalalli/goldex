part of 'transaction_cubit.dart';

@immutable
abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class UpdateUserData extends TransactionState{}

//---- get name and family
class UpdateUserDataLoading extends TransactionState{}
class UpdateUserDataSuccess extends TransactionState{}
class UpdateUserDataError extends TransactionState{
  final String message;
  UpdateUserDataError(this.message);
}

